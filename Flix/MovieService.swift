//
//  MovieService.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/23/22.
//

import Foundation

class MovieService {
	static let shared = MovieService()
	
	func fetchMovies(completion: @escaping (([Movie]) -> Void)) {
		let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData,
								 timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil,
								 delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { (data, response, error) in
			if let error = error {
				print(error.localizedDescription)
			} else if let data = data {
				let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				let moviesRawData = dataDictionary["results"] as! [[String: Any]]
				var movies = [Movie]()
				for rawData in moviesRawData {
					let movie = Movie(title: rawData["original_title"] as! String,
									  overview: rawData["overview"] as! String,
									  imageURL: self.createImageURL(with: rawData["poster_path"] as! String)
					)
					
					movies.append(movie)
				}
				completion(movies)
//				print(movies)
			}
		}
		task.resume()
	}
	
	private func createImageURL(with path: String) -> String {
		return "https://image.tmdb.org/t/p/w500" + path
	}
	
}
