//
//  PopularViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
class PopularViewModel{
    var networkService: NetworkService
    var movieList: [Movie] = []

    init() {
        networkService = NetworkService()
    }
    
    func getPopularMovies(completion: @escaping () -> Void) {
        let endPoint = "movie/popular?language=en-US&page=1"
        networkService.getRequest(endPoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let moviesModel):
                self.movieList = moviesModel.results ?? []
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    
}
