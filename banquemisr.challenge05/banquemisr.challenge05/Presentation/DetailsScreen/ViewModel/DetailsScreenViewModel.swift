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

    init(networkService: NetworkService = .shared) {
            self.networkService = networkService
        }

    func getMovieDetails(movieId: Int, completion: @escaping (String?) -> Void) {
        let endPoint = "movie/\(movieId)?language=en-US"
        networkService.getRequest(endPoint) { (result: Result<MovieDetails, Error>) in
            switch result {
            case .success(let movieDetails):
                self.movieDetails = movieDetails
                MovieDataManager.shared.saveMovieDetails(movieDetails: self.movieDetails!)
                DispatchQueue.main.async {
                    completion(nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    MovieDataManager.shared.fetchMovieDetails(by: movieId) { result in
                        switch result {
                        case .success(let movieDetails):
                            self.movieDetails = movieDetails
                            completion("You are offline. Data loaded from offline storage.")
                        case .failure(let fetchError):
                            completion("Failed to load movies, Please check your network")
                            print("Error: \(fetchError)")
                          
                        }
                    }
                }
            }
        }
    }
}
