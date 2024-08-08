//
//  ViewController.swift
//  Spar
//
//  Created by Алексей Гвоздков on 08.08.2024.
//

import UIKit

final class ShopViewController: UIViewController {
    
    private lazy var buttonCollection: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = Colors.grayButton
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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
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
            shopCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

