//
//  UpComingMoviesViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class UpComingMoviesViewController: UIViewController {
    var upComingVM: UpComingViewModel?
    @IBOutlet weak var upComingCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        upComingVM = UpComingViewModel()
        setupCollectionView()

        self.navigationController?.isNavigationBarHidden = true
        upComingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        upComingVM?.getUpComingMovies { errorMessage in
            self.upComingCV.reloadData()
            if let message = errorMessage {
                self.showAlert(title: "Offline Mode", message: message)
            }
        }
    }
    
    func setupCollectionView() {
        upComingCV.delegate = self
        upComingCV.dataSource = self
        upComingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }

   
}
