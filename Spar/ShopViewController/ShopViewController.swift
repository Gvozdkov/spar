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
        button.addTarget(self, action: #selector(buttonCollectionAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonCollectionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "buttonCollectionOne")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grayLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shopCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = viewModel.sizeCell()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .lightText
        collectionView.dataSource = self
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.cellIdentifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsViewController()
        reloadDataCollection()
        viewModel.fetchData()
    }
    
    private func settingsViewController() {
        view.backgroundColor = .white
        
        view.addSubview(buttonCollection)
        buttonCollection.addSubview(buttonCollectionImage)
        view.addSubview(lineView)
        view.addSubview(shopCollection)
        
        NSLayoutConstraint.activate([
            buttonCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            buttonCollection.heightAnchor.constraint(equalToConstant: 40),
            buttonCollection.widthAnchor.constraint(equalToConstant: 40),
            
            buttonCollectionImage.centerXAnchor.constraint(equalTo: buttonCollection.centerXAnchor),
            buttonCollectionImage.centerYAnchor.constraint(equalTo: buttonCollection.centerYAnchor),
            buttonCollectionImage.heightAnchor.constraint(equalToConstant: 18),
            buttonCollectionImage.widthAnchor.constraint(equalToConstant: 18),
            
            lineView.topAnchor.constraint(equalTo: buttonCollection.bottomAnchor, constant: 3.5),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            shopCollection.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            shopCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func reloadDataCollection() {
        viewModel.onDataLoaded = { [weak self] in
            DispatchQueue.main.async {
                self?.shopCollection.reloadData()
            }
        }
    }

    @objc private func buttonCollectionAction() {
        viewModel.toggleCellSwitch()
        buttonCollectionImage.image = UIImage(named: viewModel.toggleButtonCollectionImage())
        if let layout = shopCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            ShopCollectionViewLayoutManager.updateLayout(layout, with: viewModel.cellSwitch)
        }
    }
}

// MARK: - extension UICollectionViewDataSource
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = viewModel.cellSwitch ? GridCell.cellIdentifier : ListCell.cellIdentifier
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        if let gridCell = cell as? GridCell {
            let product = viewModel.products[indexPath.item]
            gridCell.cellUpdate(product: product)
            return gridCell
        } else if let listCell = cell as? ListCell {
            let product = viewModel.products[indexPath.item]
            //            listCell.cellUpdate(product: product)
            return listCell
        }
        
        return UICollectionViewCell()
    }
    
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return ShopCollectionViewLayoutManager.insets(for: viewModel.cellSwitch, collectionViewWidth: collectionView.bounds.width)
    }
}
