//
//  DetailsScreenViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

class DetailsScreenViewModel {
    var networkService: NetworkService
    var movieDetails: MovieDetails?

    init() {
        networkService = NetworkService()
    }

    func getMovieDetails(movieId: Int, completion: @escaping () -> Void) {
        let endPoint = "movie/\(movieId)?language=en-US"
        networkService.getRequest(endPoint) { (result: Result<MovieDetails, Error>) in
            switch result {
            case .success(let movieDetails):
                self.movieDetails = movieDetails
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
}
