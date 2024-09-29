//
//  UpComingViewModel.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation

class UpComingViewModel{
    private let fetchUpComingUseCase: FetchUpComingMoviesUseCase
    var movieList: [Movie] = []
    var errorMessage: String?

    init(useCase: FetchUpComingMoviesUseCase) {
        self.fetchUpComingUseCase = useCase
    }

    func getUpComingMovies(completion: @escaping (String?) -> Void) {
        fetchUpComingUseCase.execute { result in
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
