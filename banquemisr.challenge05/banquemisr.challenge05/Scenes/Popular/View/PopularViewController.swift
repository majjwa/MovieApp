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
        popularVM?.getPopularMovies{
            self.PopularCV.reloadData()
                }
    }
    func setupCollectionView() {
        PopularCV.delegate = self
        PopularCV.dataSource = self
        PopularCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }

   

}
