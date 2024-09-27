//
//  UpComingMoviesViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class UpComingMoviesViewController: UIViewController {

    @IBOutlet weak var upComingCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.navigationController?.isNavigationBarHidden = true
        upComingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()

    }
    func setupCollectionView() {
        upComingCV.delegate = self
        upComingCV.dataSource = self
        upComingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }

   
}
