//
//  ViewController.swift
//  Spar
//
//  Created by Алексей Гвоздков on 08.08.2024.
//

import UIKit

final class ShopViewController: UIViewController {
    private let viewModel = ShopViewModelL()
    
    private lazy var buttonCollection: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = Colors.lightGrayButton
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonCollecnionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "buttonCollectionOne")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grayLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shopCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 168, height: 278)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .lightText
        collectionView.dataSource = self
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsViewController()
    }
    
    private func settingsViewController() {
        view.backgroundColor = .white
        
        view.addSubview(buttonCollection)
        buttonCollection.addSubview(buttonCollecnionImage)
        view.addSubview(line)
        view.addSubview(shopCollection)
        
        NSLayoutConstraint.activate([
            buttonCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            buttonCollection.heightAnchor.constraint(equalToConstant: 40),
            buttonCollection.widthAnchor.constraint(equalToConstant: 40),
            
            buttonCollecnionImage.centerXAnchor.constraint(equalTo: buttonCollection.centerXAnchor),
            buttonCollecnionImage.centerYAnchor.constraint(equalTo: buttonCollection.centerYAnchor),
            buttonCollecnionImage.heightAnchor.constraint(equalToConstant: 18),
            buttonCollecnionImage.widthAnchor.constraint(equalToConstant: 18),
            
            line.topAnchor.constraint(equalTo: buttonCollection.bottomAnchor, constant: 3.5),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            
            shopCollection.topAnchor.constraint(equalTo: line.bottomAnchor),
            shopCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            shopCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            shopCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - extension UICollectionViewDataSource
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.cellIdentifier, for: indexPath) as? GridCell {
            
            return cell
        }
        return UICollectionViewCell()
    }

}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalCellWidth = 168 * 2
        let totalSpacingWidth = 5
        let leftInset = (collectionView.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        return UIEdgeInsets(top: 9, left: leftInset, bottom: 8, right: leftInset)
    }
}
