//
//  ListCell.swift
//  Spar
//
//  Created by Алексей Гвоздков on 31.08.2024.
//

import UIKit
import Kingfisher

final class ListCell: UICollectionViewCell {
    static let cellIdentifier = "ListCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
