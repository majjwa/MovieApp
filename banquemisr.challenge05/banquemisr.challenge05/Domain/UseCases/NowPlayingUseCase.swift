//
//  NowPlayingUseCase.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 29/09/2024.
//

import Foundation

class FetchNowPlayingMoviesUseCase {
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.fetchNowPlayingMovies(completion: completion)
    }
}
