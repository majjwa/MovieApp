//
//  MoviesModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

struct MoviesModel: Decodable {
    let results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Movie: Decodable {
    let id: Int
    let posterPath: String
    let title: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case releaseDate = "release_date"
    }
}
