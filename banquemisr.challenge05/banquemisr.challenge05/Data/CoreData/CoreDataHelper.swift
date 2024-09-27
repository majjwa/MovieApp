//
//  CoreDataHelper.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//
import CoreData

class MovieDataManager {
    
    static let shared = MovieDataManager()
    private init() {}

    func saveMovies(movies: [Movie]) {
        let context = CoreDataManager.shared.context
        for movie in movies {
            let localModel = LocalModel(context: context)
            localModel.id = Int64(movie.id)
            localModel.title = movie.title
            localModel.releaseDate = movie.releaseDate
            localModel.posterPath = movie.posterPath
        }
        CoreDataManager.shared.saveContext()
    }

    func saveMovieDetails(movieDetails: MovieDetails) {
        let context = CoreDataManager.shared.context
        let localModel = LocalModel(context: context)
        localModel.backdropPath = movieDetails.backdropPath
        localModel.overview = movieDetails.overview
        localModel.runtime = Int64(movieDetails.runtime)
        if let firstGenre = movieDetails.genres.first {
            localModel.genres = firstGenre.name
        } else {
            localModel.genres = ""
        }
        CoreDataManager.shared.saveContext()
    }


    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<LocalModel> = LocalModel.fetchRequest()

        do {
            let localModels = try context.fetch(fetchRequest)
            let movies = localModels.map { movieEntity in
                Movie(id: Int(movieEntity.id),
                      posterPath: movieEntity.posterPath ?? "",
                      title: movieEntity.title ?? "Loading",
                      releaseDate: movieEntity.releaseDate ?? " - - ")
            }
            completion(.success(movies))
        } catch {
            completion(.failure(error))
        }
    }

    func fetchMovieDetails(by id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<LocalModel> = LocalModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)

        do {
            let localModels = try context.fetch(fetchRequest)
            if let movieEntity = localModels.first {
                let genreName = movieEntity.genres ?? ""
                let genres: [Genre]
                if !genreName.isEmpty {
                    genres = [Genre(id: 0, name: genreName)]
                } else {
                    genres = []
                }

                let movieDetails = MovieDetails(
                    backdropPath: movieEntity.backdropPath,
                    genres: genres,
                    id: Int(movieEntity.id), 
                    overview: movieEntity.overview ?? "",
                    posterPath: movieEntity.posterPath ?? "",
                    releaseDate: movieEntity.releaseDate ?? "",
                    runtime: Int(movieEntity.runtime),
                    title: movieEntity.title ?? ""
                )
                completion(.success(movieDetails))
            } else {
                completion(.success(nil))
            }
        } catch {
            completion(.failure(error))
        }
    }


}
