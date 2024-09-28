//
//  AllMoviesTest.swift
//  banquemisr.challenge05Tests
//
//  Created by marwa maky on 28/09/2024.
//

import XCTest
@testable import banquemisr_challenge05
final class AllMoviesTest: XCTestCase {
    var networkService: NetworkService!
    
    override func setUpWithError() throws {
        super.setUp()
        networkService = NetworkService.shared
        
    }

    override func tearDownWithError() throws {
        networkService = nil
        super.tearDown()
    }

    func testFetchNowPlayingMovies() {
        let expectation = self.expectation(description: "Fetching now playing movies from API")
        let endpoint = "movie/now_playing?language=en-US&page=1"
        
        networkService.getRequest(endpoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.results?.isEmpty == true, "Movie list should not be empty")
                print("Movies fetched successfully: \(response.results ?? [])")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                XCTFail("Request failed with error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)
    }
 func testFetchPopularMovies() {
        let expectation = self.expectation(description: "Fetching popular movies from API")
        let endpoint = "movie/popular?language=en-US&page=1"

        networkService.getRequest(endpoint) { (result: Result<MoviesModel, Error>) in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.results?.isEmpty == true, "Movie list should not be empty")
                print("Movies fetched successfully: \(response.results ?? [])")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                XCTFail("Request failed with error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)
    }
 func testFetchUpComingMovies() {
           let expectation = self.expectation(description: "Fetching upComing movies from API")
           let endpoint = "movie/upcoming?language=en-US&page=1"

           networkService.getRequest(endpoint) { (result: Result<MoviesModel, Error>) in
               switch result {
               case .success(let response):
                   XCTAssertFalse(response.results?.isEmpty == true, "Movie list should not be empty")
                   print("Movies fetched successfully: \(response.results ?? [])")
               case .failure(let error):
                   print("Error: \(error.localizedDescription)")
                   XCTFail("Request failed with error: \(error.localizedDescription)")
               }
               expectation.fulfill()
           }
           
           waitForExpectations(timeout: 20, handler: nil)
       }
    
    
    
    
}
