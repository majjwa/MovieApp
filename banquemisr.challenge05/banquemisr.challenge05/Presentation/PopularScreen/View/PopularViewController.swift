//
//  PopularViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class PopularViewController: UIViewController {
    var popularVM: PopularViewModel?
    @IBOutlet weak var PopularCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        popularVM = PopularViewModel()
        self.navigationController?.isNavigationBarHidden = true
        PopularCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        popularVM?.getPopularMovies{ errorMessage in
            self.PopularCV.reloadData()
            if let message = errorMessage {
                self.showAlert(title: "Offline Mode", message: message)
            }
                }
    }
    
    func setupCollectionView() {
        PopularCV.delegate = self
        PopularCV.dataSource = self
        PopularCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }

   

}
