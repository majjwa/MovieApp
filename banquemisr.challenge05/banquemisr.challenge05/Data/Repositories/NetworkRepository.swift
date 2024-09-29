//
//  NetworkRepository.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 29/09/2024.
//

import Foundation
class NetworkMoviesRepository: MoviesRepository {
    private let networkService: NetworkService
    private let movieDataManager: MovieDataManager

    init(networkService: NetworkService = .shared, movieDataManager: MovieDataManager = .shared) {
        self.networkService = networkService
        self.movieDataManager = movieDataManager
    }

  func fetchNowPlayingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let endPoint = "movie/now_playing?language=en-US&page=1"
        networkService.getRequest(endPoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let moviesModel):
                let movies = moviesModel.results ?? []
                self.movieDataManager.saveMovies(movies: movies)
                completion(.success(movies))
                
            case .failure(let error):
                print("Network request failed, trying to fetch from Core Data: \(error)")
                self.movieDataManager.fetchMovies { coreDataResult in
                    switch coreDataResult {
                    case .success(let movies):
                        if !movies.isEmpty {
                            completion(.success(movies))
                        } else {
                            completion(.failure(error))
                        }
                    case .failure(let coreDataError):
                        completion(.failure(coreDataError))
                    }
                }
            }
        }
    }

    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        let endPoint = "movie/\(id)?language=en-US"
        
        networkService.getRequest(endPoint) { (result: Result<MovieDetails, Error>) in
            switch result {
            case .success(let movieDetails):
                self.movieDataManager.saveMovieDetails(movieDetails: movieDetails)
                completion(.success(movieDetails))
        
            case .failure(let error):
                print("Network request failed, trying to fetch from Core Data: \(error)")
                self.movieDataManager.fetchMovieDetails(by: id) { coreDataResult in
                    switch coreDataResult {
                    case .success(let movieDetails):
                        if let details = movieDetails {
                            completion(.success(details))
                        } else {
                            completion(.failure(error))
                        }
                    case .failure(let coreDataError):
                        completion(.failure(coreDataError))
                    }
                }
            }
        }
    }
    func fetchUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
            let endPoint = "movie/upcoming?language=en-US&page=1"
         networkService.getRequest(endPoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let moviesModel):
                let movies = moviesModel.results ?? []
                self.movieDataManager.saveMovies(movies: movies)
                completion(.success(movies))
                
            case .failure(let error):
                print("Network request failed, trying to fetch from Core Data: \(error)")
                self.movieDataManager.fetchMovies { coreDataResult in
                    switch coreDataResult {
                    case .success(let movies):
                        if !movies.isEmpty {
                            completion(.success(movies))
                        } else {
                            completion(.failure(error))
                        }
                    case .failure(let coreDataError):
                        completion(.failure(coreDataError))
                    }
                }
            }
        }
    }
func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
            let endPoint = "movie/popular?language=en-US&page=1"
            networkService.getRequest(endPoint) { (result: Result<MoviesModel, Error>) in
                switch result {
                case .success(let moviesModel):
                    let movies = moviesModel.results ?? []
                    self.movieDataManager.saveMovies(movies: movies)
                    completion(.success(movies))
                    
                case .failure(let error):
                    print("Network request failed, trying to fetch from Core Data: \(error)")
                    self.movieDataManager.fetchMovies { coreDataResult in
                        switch coreDataResult {
                        case .success(let movies):
                            if !movies.isEmpty {
                                completion(.success(movies))
                            } else {
                                completion(.failure(error))
                            }
                        case .failure(let coreDataError):
                            completion(.failure(coreDataError))
                        }
                    }
                }
            }
        }
    }
