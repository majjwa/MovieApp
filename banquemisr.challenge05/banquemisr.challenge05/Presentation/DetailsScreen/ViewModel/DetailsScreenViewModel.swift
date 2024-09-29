//
//  DetailsScreenViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//
 import Foundation

class DetailsScreenViewModel {
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    var movieDetails: MovieDetails?
    var errorMessage: String?

    init(useCase: FetchMovieDetailsUseCase) {
        self.fetchMovieDetailsUseCase = useCase
    }

    func getMovieDetails(movieId: Int, completion: @escaping (String?) -> Void) {
        fetchMovieDetailsUseCase.execute(movieId: movieId) { result in
            switch result {
            case .success(let movieDetails):
                self.movieDetails = movieDetails
                completion(nil)
                
            case .failure(let error):
                print("Error: \(error)")
                self.errorMessage = "Failed to load movies. Please check your network."
                completion(self.errorMessage)
            }
        }
    }

}
