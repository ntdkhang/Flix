//
//  MovieService.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/23/22.
//

import Foundation

class MovieService {
	static let shared = MovieService()
	private var apiKey = "api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
	
	func fetchMovies(_ type: FetchTypeURL = .all,
					 completion: @escaping (([Movie]) -> Void)) {
		let urlString = "https://api.themoviedb.org/3/movie" + type.rawValue + apiKey
		let url = URL(string: urlString)!
//		let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
		let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData,
								 timeoutInterval: 10)
		let session = URLSession(configuration: .default, delegate: nil,
								 delegateQueue: OperationQueue.main)
		let task = session.dataTask(with: request) { (data, response, error) in
			if let error = error {
				print(error.localizedDescription)
			} else if let data = data {
				let decoder = JSONDecoder()
				var movies = [Movie]()
				let movieData = try! decoder.decode(MovieData.self, from: data)
				let results = movieData.results

				for result in results {
					let title = result.title
					let overview = result.overview
					let posterURL = result.posterURL
					let backdropURL = result.backdropURL

					let movie = Movie(title: title,
									  overview: overview,
									  posterURL: posterURL,
									  backdropURL: backdropURL)
					movies.append(movie)
				}

				completion(movies)
//				print(movies)
			}
		}
		task.resume()
	}
	

	private func createImageURL(with path: String) -> URL {
		return URL(string: "https://image.tmdb.org/t/p/original" + path)!
	}
	
	enum FetchTypeURL: String {
		case all = "/now_playing?"
		case superhero = "/414906/similar?"
	}
}


