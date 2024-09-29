//
//  MovieDetailsTest.swift
//  banquemisr.challenge05Tests
//
//  Created by marwa maky on 28/09/2024.
//

import XCTest
@testable import banquemisr_challenge05
final class MovieDetailsTest: XCTestCase {
    var viewModel: DetailsScreenViewModel!
    var networkService: NetworkService!

    override func setUpWithError() throws {
        networkService = NetworkService.shared
        viewModel = DetailsScreenViewModel(networkService: networkService)

    }

    override func tearDownWithError() throws {
        viewModel = nil
        networkService = nil
       super.tearDown()
    }
    func testGetMovieDetailsSuccess() {
        let expectation = XCTestExpectation(description: "Completion handler invoked")
        viewModel.getMovieDetails(movieId:957452) { errorMessage in
            XCTAssertNil(errorMessage, "Expected no error message")
            XCTAssertNotNil(self.viewModel.movieDetails, "Expected movie details to be populated")
            XCTAssertEqual(self.viewModel.movieDetails?.id, 957452, "Expected movie ID to match")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    func testGetMovieDetailsFailure() {
        let expectation = XCTestExpectation(description: "Completion handler invoked")
        let invalidMovieId = -1

        viewModel.getMovieDetails(movieId: invalidMovieId) { errorMessage in
            XCTAssertNotNil(errorMessage, "Expected an error message")
            XCTAssertNil(self.viewModel.movieDetails, "Expected movie details to be nil")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0) 
    }


}
