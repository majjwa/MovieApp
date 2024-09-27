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
        nowPlayingVM?.getNowPlayingMovies {
            self.nowPlayingCV.reloadData()
                }
    }
    func setupCollectionView() {
        nowPlayingCV.delegate = self
        nowPlayingCV.dataSource = self
        nowPlayingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }


}
