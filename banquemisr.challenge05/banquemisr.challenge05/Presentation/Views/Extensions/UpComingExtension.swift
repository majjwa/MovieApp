//
//  UpComingExtension.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
import UIKit
extension UpComingMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingVM?.movieList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else {
            fatalError("Unable to dequeue MoviesCollectionViewCell")
        }
        let movie = upComingVM?.movieList[indexPath.item]
        cell.movieTitle.text = movie?.title
        cell.movieReleaseDate.text = movie?.releaseDate
        let imagePath = "https://image.tmdb.org/t/p/w500" + (movie?.posterPath ?? "")
        cell.movieImg.loadImage(from: imagePath)
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsScreenViewController") as? DetailsScreenViewController {
            let movie = upComingVM?.movieList[indexPath.item]
            detailsVC.movieId = movie?.id
            
            detailsVC.modalPresentationStyle = .pageSheet
            present(detailsVC, animated: true)
        }
      
        
    }

    
  
}
