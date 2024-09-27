//
//  CollectionViewExtension.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
import UIKit
extension UICollectionView {
    
    // generic method to register cells from a NIB file.
  func RegisterNib<cell : UICollectionViewCell>(cell : cell.Type){
           let nibName = String(describing : cell.self)
           self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        }
}
