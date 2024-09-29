//
//  NetworkManager.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
class NetworkService{
    public static let shared = NetworkService()
    private init() {}
    //Constants
    private let apiKey = "7c51949919649e5de3d2e5399e7a9b26"
    private let baseURL = "https://api.themoviedb.org/3/"
    
func getRequest<T: Decodable>(_ endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        
    guard let url = URL(string: "\(baseURL)\(endpoint)?api_key=\(apiKey)") else {
            completion(.failure(URLError(.badURL)))
            return
        }
       var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzUxOTQ5OTE5NjQ5ZTVkZTNkMmU1Mzk5ZTdhOWIyNiIsIm5iZiI6MTcyNzQ0NDAwMC44ODgzNDksInN1YiI6IjY0MmMwZTBhOGRlMGFlMDBkNWY0YmY2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mddQS4ycuKC6v2Mf3V07oeUwEfLFQMERI5CV4ACJE1s", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }
        
      
        task.resume()
    }
}
