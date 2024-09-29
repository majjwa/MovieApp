//
//  UpComingViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
class UpComingViewModel{
    var networkService: NetworkService
    var movieList: [Movie] = []
    init(networkService: NetworkService = .shared) {
            self.networkService = networkService
        }
    
    func getUpComingMovies(completion: @escaping (String?) -> Void) {
        let endPoint = "movie/upcoming?language=en-US&page=1"
        networkService.getRequest(endPoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let moviesModel):
                self.movieList = moviesModel.results ?? []
                MovieDataManager.shared.saveMovies(movies: self.movieList)
                DispatchQueue.main.async {
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    MovieDataManager.shared.fetchMovies { result in
                        switch result {
                        case .success(let movies):
                            self.movieList = movies
                            completion("You are offline. Data loaded from offline storage.")
                        case .failure(let fetchError):
                            completion("Failed to load movies, Please check your network")
                            print("Error fetching from Core Data: \(fetchError)")

                        
                        }
                    }
                }
            }
        }
    }

    
}
