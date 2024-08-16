//
//  LikeButtonsView.swift
//  Spar
//
//  Created by Алексей Гвоздков on 12.08.2024.
//

import UIKit

class LikeButtonsView: UIView {
    var shoppingListButtonAction: (() -> Void)?
    var likeButtonAction: (() -> Void)?
    
    private lazy var shoppingListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.whiteStack
        button.layer.cornerRadius = 16
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        button.addTarget(self, action: #selector(shoppingListButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shoppingListImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shoppingListButton")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .darkGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.whiteStack
        button.layer.cornerRadius = 16
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var likeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "likeButton")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .darkGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var butonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [shoppingListButton, likeButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintsSettingsView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func constraintsSettingsView() {
        addSubview(butonStack)

           shoppingListButton.addSubview(shoppingListImage)
           likeButton.addSubview(likeImage)
        
        NSLayoutConstraint.activate([
            butonStack.heightAnchor.constraint(equalToConstant: 64),
            butonStack.widthAnchor.constraint(equalToConstant: 32),
            
            shoppingListImage.centerXAnchor.constraint(equalTo: shoppingListButton.centerXAnchor),
            shoppingListImage.centerYAnchor.constraint(equalTo: shoppingListButton.centerYAnchor),
            
            likeImage.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor),
            likeImage.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
        ])
    }
    
    
    @objc private func shoppingListButtonTapped() {
        shoppingListButtonAction?()
    }
    
    @objc private func likeButtonTapped() {
        likeButtonAction?()
    }
    
    
}
