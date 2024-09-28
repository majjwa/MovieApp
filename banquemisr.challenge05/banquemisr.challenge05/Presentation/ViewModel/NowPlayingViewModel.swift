//
//  NowPlayingViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
class NowPlayingViewModel{
    var networkService: NetworkService
    var movieList: [Movie] = []

    init() {
        networkService = NetworkService()
    }
    
    func getNowPlayingMovies(completion: @escaping (String?) -> Void) {
        let endPoint = "movie/now_playing?language=en-US&page=1"
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
                        case .failure(let error):
                            print(error)
                            completion("Failed to load movies, Please check your network")
                        }
                    }
                }
            }
        }
    }

        } 

