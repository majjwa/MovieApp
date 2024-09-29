//
//  MoviesRepository.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 29/09/2024.
//

import Foundation
// Domain/Repositories/MoviesRepository.swift
protocol MoviesRepository {
    func fetchNowPlayingMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)

}
