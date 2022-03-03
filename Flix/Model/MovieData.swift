//
//  Movie.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/23/22.
//
import Foundation

struct MovieData: Codable {
	let results: [Result]
}

struct Result: Codable {
	
	
	let title: String
	let overview: String
	let posterPath: String
	let backdropPath: String
	
	enum CodingKeys: String, CodingKey {
		case title = "original_title"
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		
		case overview
	}
	
	
	var posterURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)!
	}
	
	var backdropURL: URL {
		return URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
	}
	
	private func getURLString(from path: String) -> String {
		"https://image.tmdb.org/t/p/w500" + path
	}
}
