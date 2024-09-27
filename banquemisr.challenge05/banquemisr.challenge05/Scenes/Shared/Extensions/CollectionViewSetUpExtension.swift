//
//  CollectionViewSetUpExtension.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {
    // set up the apperance of the collection view
    static func createStandardFlowLayout(itemSpacing: CGFloat = 12, sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10), itemsPerRow: Int = 2, itemHeight: CGFloat = 220) -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        let totalSpacing = itemSpacing * CGFloat(itemsPerRow - 1)
        let availableWidth = UIScreen.main.bounds.width - sectionInsets.left - sectionInsets.right - totalSpacing
        let itemWidth = availableWidth / CGFloat(itemsPerRow)
        
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        layout.sectionInset = sectionInsets
        
        return layout
    }
}
