//
//  ShopCollectionViewLayoutManager.swift
//  Spar
//
//  Created by Алексей Гвоздков on 31.08.2024.
//

import UIKit

final class ShopCollectionViewLayoutManager {
    
    static func createLayout(cellSwitch: Bool) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        if cellSwitch {
            layout.itemSize = CGSize(width: 168, height: 278)
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
        } else {
            layout.itemSize = CGSize(width: 375, height: 176)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
        return layout
    }
    
    static func updateLayout(_ layout: UICollectionViewFlowLayout, with cellSwitch: Bool) {
        layout.itemSize = cellSwitch ? CGSize(width: 168, height: 278) : CGSize(width: 375, height: 176)
        layout.invalidateLayout()
    }
    
    static func insets(for cellSwitch: Bool, collectionViewWidth: CGFloat) -> UIEdgeInsets {
        if cellSwitch {
            let totalCellWidth = 168 * 2
            let totalSpacingWidth = 5
            let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            return UIEdgeInsets(top: 9, left: leftInset, bottom: 8, right: leftInset)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
