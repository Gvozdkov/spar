//
//  GridCell.swift
//  Spar
//
//  Created by Алексей Гвоздков on 08.08.2024.
//

import UIKit

final class GridCell: UICollectionViewCell {
    static let cellIdentifier = "GridCell"
    private let universalUIElements = UniversalUIElements()
    private let likeButtonsView = LikeButtonsView()
    private let unitMeasurementView = UnitMeasurementView()
    private let coutingsButtonsView  = CoutingsButtonsView()
    private var oldPrice = ""
    
    private lazy var shadowContainerView: UIView = {
        return universalUIElements.createShadowContainerView()
    }()
    
    private lazy var productImage: UIImageView = {
        return universalUIElements.createProductImageView(widthAnchor: 168,
                                                          heightAnchor: 168)
    }()
    
    private lazy var ratingImage: UIImageView = {
        return universalUIElements.createRatingImageView()
    }()
    
    private lazy var ratingLabel: UILabel = {
        return universalUIElements.createLabel(fontSize: 12, 
                                               weight: .light,
                                               textColor: .black)
    }()
    
    private lazy var ratingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ratingImage, ratingLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var discountLabel: UILabel = {
        return universalUIElements.createLabel(fontSize: 16,
                                               weight: .bold,
                                               textColor: Colors.redDiscount)
    }()
    
    private lazy var ratingAndDiscountStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ratingStack, discountLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = universalUIElements.createLabel(fontSize: 12,
                                                    weight: .light,
                                                    textColor: .black)
        label.sizeToFit()
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var newPriceIntegerLabel: UILabel = {
        return universalUIElements.createLabel(fontSize: 20,
                                               weight: .bold,
                                               textColor: .black)
    }()
    
    private lazy var newPriceWholeLabel: UILabel = {
        return universalUIElements.createLabel(fontSize: 16,
                                               weight: .bold,
                                               textColor: .black)
    }()
    
    private lazy var unitView: UIView = {
        return universalUIElements.createUnitView()
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let label = universalUIElements.createLabel(fontSize: 12,
                                                    weight: .regular,
                                                    textColor: .gray)
        let attributedString = NSAttributedString(
            string: oldPrice,
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var cartButtonView: UIButton = {
        return universalUIElements.createCartButton()
    }()
    
    private lazy var promotionalView: UIView = {
        let view = universalUIElements.createPromotionalView("Удар по ценам")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        productImage.image = UIImage(named: "Card-image")
        ratingLabel.text = "4.1"
        discountLabel.text = "25%"
        productNameLabel.text = "Дорадо Охлажденная Непотрошеная 300-400г"
        newPriceIntegerLabel.text = "90"
        newPriceWholeLabel.text = "99"
        oldPrice = "899,99"
        coutingsButtonsView.productWeightText = "0.2" + " кг"
        coutingsButtonsView.priceLabelText = "55"
        
        universalUIElements.setupCellAppearance(for: contentView)
        constraintsSettingsView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    private func constraintsSettingsView() {
        likeButtonsView.translatesAutoresizingMaskIntoConstraints = false
        coutingsButtonsView.translatesAutoresizingMaskIntoConstraints = false
        unitMeasurementView.translatesAutoresizingMaskIntoConstraints = false
        
        coutingsButtonsView.isHidden = true
        unitMeasurementView.isHidden = true
        
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(contentView)
        contentView.addSubview(productImage)
        contentView.addSubview(promotionalView)
        contentView.addSubview(ratingAndDiscountStack)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(newPriceIntegerLabel)
        contentView.addSubview(newPriceWholeLabel)
        contentView.addSubview(unitView)
        contentView.addSubview(oldPriceLabel)
        contentView.addSubview(cartButtonView)
        contentView.addSubview(likeButtonsView)
        contentView.addSubview(unitMeasurementView)
        contentView.addSubview(coutingsButtonsView)
        
        NSLayoutConstraint.activate([
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            
            promotionalView.topAnchor.constraint(equalTo: productImage.topAnchor),
            promotionalView.topAnchor.constraint(equalTo: productImage.topAnchor),
            promotionalView.widthAnchor.constraint(equalToConstant: 84),
            promotionalView.heightAnchor.constraint(equalToConstant: 16),
       
            
            ratingAndDiscountStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 152),
            ratingAndDiscountStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            ratingAndDiscountStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            ratingAndDiscountStack.heightAnchor.constraint(equalToConstant: 20),
            
            productNameLabel.topAnchor.constraint(equalTo: ratingAndDiscountStack.bottomAnchor, constant: 8),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            productNameLabel.heightAnchor.constraint(equalToConstant: 58),
            
            newPriceIntegerLabel.topAnchor.constraint(equalTo: ratingImage.bottomAnchor, constant: 70),
            newPriceIntegerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            newPriceWholeLabel.topAnchor.constraint(equalTo: ratingImage.bottomAnchor, constant: 71),
            newPriceWholeLabel.leadingAnchor.constraint(equalTo: newPriceIntegerLabel.trailingAnchor, constant: 2),
            
            unitView.leadingAnchor.constraint(equalTo: newPriceWholeLabel.trailingAnchor, constant: 4),
            unitView.topAnchor.constraint(equalTo: ratingImage.bottomAnchor, constant: 70),
            
            oldPriceLabel.topAnchor.constraint(equalTo: newPriceIntegerLabel.bottomAnchor),
            oldPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            cartButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            cartButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            coutingsButtonsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            coutingsButtonsView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            coutingsButtonsView.widthAnchor.constraint(equalToConstant: 160),
            coutingsButtonsView.heightAnchor.constraint(equalToConstant: 36),
            
            unitMeasurementView.bottomAnchor.constraint(equalTo: coutingsButtonsView.topAnchor, constant: -4),
            unitMeasurementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            unitMeasurementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            unitMeasurementView.heightAnchor.constraint(equalToConstant: 28),
            
            likeButtonsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            likeButtonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            likeButtonsView.heightAnchor.constraint(equalToConstant: 64),
            likeButtonsView.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func setupActions() {
        likeButtonsView.likeButtonAction = { [weak self] in
            self?.handleShoppingListButton()
        }
    }
    
    private func handleShoppingListButton() {
        print("handleShoppingListButton")
    }
}
