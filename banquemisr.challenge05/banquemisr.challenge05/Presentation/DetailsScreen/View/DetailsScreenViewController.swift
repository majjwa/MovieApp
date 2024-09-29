//
//  DetailsScreenViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit
import Foundation
class DetailsScreenViewController: UIViewController {
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    var movieId: Int?
    var detailsScreenVM: DetailsScreenViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIWithDefaultValues()
        self.img1.layer.cornerRadius = 13
        self.img1.layer.masksToBounds = true
        self.img2.layer.cornerRadius = 13
        self.img2.layer.masksToBounds = true
        let repository = NetworkMoviesRepository()
       let fetchMovieDetailsUseCase = FetchMovieDetailsUseCase(repository: repository)
       detailsScreenVM = DetailsScreenViewModel(useCase: fetchMovieDetailsUseCase)      
        self.navigationController?.isNavigationBarHidden = true
        if let movieId = movieId {
                    fetchMovieDetails(for: movieId)
                }
        }
    func fetchMovieDetails(for movieId: Int) {
            detailsScreenVM?.getMovieDetails(movieId: movieId) { errorMessage in
                DispatchQueue.main.async {
                    self.updateUI()
                    if let message = errorMessage {
                        self.showAlert(title: "Offline Mode", message: message)
                    }}
            }
        }

    
    func updateUIWithDefaultValues() {
        movieTitle.text = "Loading..."
        movieGenre.text = "N/A"
        movieTime.text = "N/A"
        movieReleaseDate.text = "N/A"
        movieDescription.text = "N/A"
        img1.image = UIImage(named: "loading")
        img2.image = UIImage(named: "loading")
    }

    func updateUI() {
        movieTitle.text = detailsScreenVM?.movieDetails?.title
        movieGenre.text = detailsScreenVM?.movieDetails?.genres.first?.name
        movieTime.text = "\(detailsScreenVM?.movieDetails?.runtime ?? 0) min"
        if let releaseDate = detailsScreenVM?.movieDetails?.releaseDate {
            let year = String(releaseDate.prefix(4))
            movieReleaseDate.text = year
        }
        movieDescription.text = detailsScreenVM?.movieDetails?.overview
        let imagePath2 = "https://image.tmdb.org/t/p/w500" + (detailsScreenVM?.movieDetails?.backdropPath ?? "")
        img2.loadImage(from: imagePath2)
        let imagePath1 = "https://image.tmdb.org/t/p/w500" + (detailsScreenVM?.movieDetails?.posterPath ?? "")
        img1.loadImage(from: imagePath1)
    }

    @IBAction func dismissBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

   
}
