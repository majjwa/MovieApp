//
//  MoviesCollectionViewCell.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

          self.layer.cornerRadius = 13
          self.layer.masksToBounds = true
    }

}
