//
//  MovieDetailsModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

struct MovieDetails: Codable {
    
    let backdropPath: String?
    let genres: [Genre]
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let title: String
  
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
    }
}


struct Genre: Codable {
    let id: Int
    let name: String
}
