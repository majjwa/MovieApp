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
    var onError: ((String) -> Void)?

    init() {
        networkService = NetworkService()
    }

    func getMovieDetails(movieId: Int, completion: @escaping () -> Void) {
        let endPoint = "movie/\(movieId)?language=en-US"
        networkService.getRequest(endPoint) { (result: Result<MovieDetails, Error>) in
            switch result {
            case .success(let movieDetails):
                self.movieDetails = movieDetails
                MovieDataManager.shared.saveMovieDetails(movieDetails: self.movieDetails!)
                
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    MovieDataManager.shared.fetchMovieDetails(by: movieId) { result in
                        switch result {
                        case .success(let movieDetails):
                            self.movieDetails = movieDetails
                            DispatchQueue.main.async {
                                completion()
                            }
                        case .failure(let fetchError):
                            print("Error fetching from Core Data: \(fetchError)")
                            DispatchQueue.main.async {
                            self.onError?(error.localizedDescription)  
                                            }
                        }
                    }
                }
            }
        }
    }
}
