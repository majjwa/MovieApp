//
//  PopularViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

class PopularViewModel {
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    var movieList: [Movie] = []
    var errorMessage: String?
    init(fetchPopularMoviesUseCase: FetchPopularMoviesUseCase) {
        self.fetchPopularMoviesUseCase = fetchPopularMoviesUseCase
    }

    func getPopularMovies(completion: @escaping (String?) -> Void) {
        fetchPopularMoviesUseCase.execute { result in
            switch result {
            case .success(let movies):
                self.movieList = movies
                completion(nil)
                
            case .failure(let error):
                print("Error: \(error)")
                self.errorMessage = "Failed to load movies. Please check your network."
                completion(self.errorMessage)
            }
        }
    }
}
