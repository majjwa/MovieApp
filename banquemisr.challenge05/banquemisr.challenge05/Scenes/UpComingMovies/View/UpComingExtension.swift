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
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else {
            fatalError("Unable to dequeue MoviesCollectionViewCell")
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsScreenViewController") as? DetailsScreenViewController {
               detailsVC.modalPresentationStyle = .pageSheet
               present(detailsVC, animated: true)
           }
      
        
    }

    
  
}
