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
    
    func getNowPlayingMovies(completion: @escaping () -> Void) {
        let endPoint = "movie/now_playing?language=en-US&page=1"
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
