//
//  DetailsScreenViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

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
        self.img1.layer.cornerRadius = 13
        self.img1.layer.masksToBounds = true
        self.img2.layer.cornerRadius = 13
        self.img2.layer.masksToBounds = true
        super.viewDidLoad()
        detailsScreenVM = DetailsScreenViewModel()
        self.navigationController?.isNavigationBarHidden = true
        if let movieId = movieId {
            detailsScreenVM?.getMovieDetails(movieId: movieId) {
                       self.updateUI()
                   }
               }
    }
    func updateUI(){
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
