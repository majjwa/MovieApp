//
//  MovieDetailsUseCase.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 29/09/2024.
//
import Foundation

class FetchMovieDetailsUseCase {
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(movieId: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        repository.fetchMovieDetails(by: movieId, completion: completion)
    }
}
