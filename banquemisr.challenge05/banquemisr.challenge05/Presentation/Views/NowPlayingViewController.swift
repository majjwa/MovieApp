//
//  NowPlayingViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class NowPlayingViewController: UIViewController {
    @IBOutlet weak var nowPlayingCV: UICollectionView!
    var nowPlayingVM: NowPlayingViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        nowPlayingVM = NowPlayingViewModel()
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionView()
        nowPlayingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        nowPlayingVM?.getNowPlayingMovies { errorMessage in
            self.nowPlayingCV.reloadData()
            
            if let message = errorMessage {
                self.showAlert(title: "Offline Mode", message: message)
            }
        }

    }
   
    func setupCollectionView() {
        nowPlayingCV.delegate = self
        nowPlayingCV.dataSource = self
        nowPlayingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }


}
