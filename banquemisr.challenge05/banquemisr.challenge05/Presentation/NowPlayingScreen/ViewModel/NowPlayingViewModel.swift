//
//  NowPlayingViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//
//  NowPlayingViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

class NowPlayingViewModel {
    private let fetchNowPlayingMoviesUseCase: FetchNowPlayingMoviesUseCase
    var movieList: [Movie] = []
    var errorMessage: String?

    init(useCase: FetchNowPlayingMoviesUseCase) {
        self.fetchNowPlayingMoviesUseCase = useCase
    }

    func getNowPlayingMovies(completion: @escaping (String?) -> Void) {
        
        fetchNowPlayingMoviesUseCase.execute { result in
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
