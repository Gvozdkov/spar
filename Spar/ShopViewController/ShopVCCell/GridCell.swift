//
//  GridCell.swift
//  Spar
//
//  Created by Алексей Гвоздков on 08.08.2024.
//

import UIKit
import Kingfisher

final class GridCell: UICollectionViewCell {
    static let cellIdentifier = "GridCell"
    private let universalUIElements = UniversalUIElements()
    private let updateUniversalUIElements = UpdateUniversalUIElements()
    private let likeButtonsView = LikeButtonsView()
    private let cartButtonView = CartButtonView()
    private let unitMeasurementView = UnitMeasurementView()
    private let coutingsButtonsView  = CoutingsButtonsView()
    private var productWeight = 0.0
    private var productCount = 0
    private var itemTotalPrice: Float = 0.0
    private var itemPrice: Float = 0.0
    
    private lazy var shadowContainerView: UIView = {
        return universalUIElements.createShadowContainerView()
    }()
    
    private lazy var productImage: UIImageView = {
        let image = universalUIElements.createProductImageView(widthAnchor: 168,
                                                               heightAnchor: 168)
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        return image
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
    
    private lazy var productNameLabel: UILabel = {
        let label = universalUIElements.createLabel(fontSize: 12,
                                                    weight: .light,
                                                    textColor: .black)
        label.sizeToFit()
        label.numberOfLines = 3
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
        return label
    }()
    
    private lazy var promotionalView: UIView = {
        return universalUIElements.createPromotionalView(color: .clear, text: "")
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        universalUIElements.setupCellAppearance(for: contentView)
        constraintsSettingsView()
        setupActions()
        setupCartButtonActions()
        satupMinusButtonCoutingsButtonsView()
        satupPlusButtonCoutingsButtonsView()
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
        cartButtonView.translatesAutoresizingMaskIntoConstraints = false
        unitMeasurementView.translatesAutoresizingMaskIntoConstraints = false
        
        coutingsButtonsView.isHidden = true
        unitMeasurementView.isHidden = true
        
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(contentView)
        contentView.addSubview(productImage)
        productImage.addSubview(ratingStack)
        productImage.addSubview(discountLabel)
        
        contentView.addSubview(promotionalView)
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
            promotionalView.leadingAnchor.constraint(equalTo: productImage.leadingAnchor),
            promotionalView.widthAnchor.constraint(equalToConstant: 84),
            promotionalView.heightAnchor.constraint(equalToConstant: 16),
            
            ratingStack.leadingAnchor.constraint(equalTo: productImage.leadingAnchor),
            ratingStack.bottomAnchor.constraint(equalTo: productImage.bottomAnchor),
            
            discountLabel.trailingAnchor.constraint(equalTo: productImage.trailingAnchor),
            discountLabel.bottomAnchor.constraint(equalTo: productImage.bottomAnchor),
            
            productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
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
            cartButtonView.widthAnchor.constraint(equalToConstant: 48),
            cartButtonView.heightAnchor.constraint(equalToConstant: 36),
            
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
    
    func cellUpdate(product: ProductModel) {
        if let imageURL = URL(string: product.photo) {
            productImage.kf.setImage(with: imageURL)
        }
        
        productNameLabel.text = product.name
        itemPrice = product.discountedPrice
        
        unitMeasurementView.unitMeasurement = product.unitMeasurement
        
        updateUniversalUIElements.updateUnitView(unitView: unitView, unitMeasurement: product.unitMeasurement)
        
        updateUniversalUIElements.updateDiscountLabel(discountPrice: product.discount,
                                                      discountLabel: discountLabel)

        updateUniversalUIElements.updateRatingLabel(ratingLabel: ratingLabel,
                                                    ratingStack: ratingStack,
                                                    rating: product.rating)
        
        updateUniversalUIElements.updatePrice(newPriceIntegerLabel: newPriceIntegerLabel,
                                              newPriceWholeLabel: newPriceWholeLabel,
                                              discountedPrice: product.discountedPrice)
        
        updateUniversalUIElements.updateOldPriceLabel(oldPrice: product.oldPrice,
                                                      discountedPrice: product.discountedPrice,
                                                      oldPriceLabel: oldPriceLabel)

        updateUniversalUIElements.updatePromotionalView(promotionalView: promotionalView,
                                                        promotion: product.promotionalProduct)
    }

    private func updateProductQuantity(isHidden: Bool, widthAnchor: CGFloat, heightAnchor: CGFloat) {
        if productWeight <= 0.1, productCount <= 1 {
            cartButtonView.isHidden = isHidden
            newPriceIntegerLabel.isHidden = isHidden
            newPriceWholeLabel.isHidden = isHidden
            oldPriceLabel.isHidden = isHidden
            unitView.isHidden = isHidden
            unitMeasurementView.isHidden = !isHidden
            coutingsButtonsView.isHidden = !isHidden
            universalUIElements.animatioinsProfuct(imageView: productImage,
                                                   widthAnchor: widthAnchor,
                                                   heightAnchor: heightAnchor)
        }
    }
    
    // MARK: - Actions Buttons
    private func setupCartButtonActions() {
        cartButtonView.cartButtonAction = { [weak self] in
            self?.cartButtonAction()
        }
    }
    
    private func cartButtonAction() {
        updateProductQuantity(isHidden: true,
                              widthAnchor: 168,
                              heightAnchor: 148)

        if unitMeasurementView.unitMeasurement == 1 {
            productCount += 1
    
            if productCount == 0 {
                productCount = 1
            }
            
            coutingsButtonsView.productWeightText = "\(productCount) шт"
          } else if unitMeasurementView.unitMeasurement == 2 {  // шт
              productWeight += 0.1
              if productWeight != 0.1 {
                  productWeight = 0.1
              }
              productWeight = round(productWeight * 10) / 10.0
              coutingsButtonsView.productWeightText = "\(productWeight) кг"
          }
        itemTotalPrice += itemPrice
        let roundedTotalPrice = String(format: "%.2f", itemTotalPrice)
          coutingsButtonsView.priceLabelText = roundedTotalPrice
    }
    
    //поменять нейменг
    private func setupActions() {
        likeButtonsView.likeButtonAction = { [weak self] in
            self?.handleShoppingListButton()
        }
    }
    
    private func handleShoppingListButton() {
        
    }
    
    private func satupMinusButtonCoutingsButtonsView() {
        coutingsButtonsView.minusButtonAction = { [weak self] in
            self?.minusButtonAction()
        }
    }
    
    private func minusButtonAction() {
        itemTotalPrice -= itemPrice
        let roundedTotalPrice = String(format: "%.2f", itemTotalPrice)
          coutingsButtonsView.priceLabelText = roundedTotalPrice
        
        updateProductQuantity(isHidden: false,
                              widthAnchor: 168,
                              heightAnchor: 168)
        if unitMeasurementView.unitMeasurement == 1 {  // кг
            productCount -= 1
            coutingsButtonsView.productWeightText = "\(productCount) шт"
          } else if unitMeasurementView.unitMeasurement == 2 {  // шт
              productWeight -= 0.1
              productWeight = round(productWeight * 10) / 10.0
              coutingsButtonsView.productWeightText = "\(productWeight) кг"
          }
    }
    
    private func satupPlusButtonCoutingsButtonsView() {
        coutingsButtonsView.plusButtonAction = { [weak self] in
            self?.plusButtonAction()
        }
    }
    
    private func plusButtonAction() {
        itemTotalPrice += itemPrice
        let roundedTotalPrice = String(format: "%.2f", itemTotalPrice)
          coutingsButtonsView.priceLabelText = roundedTotalPrice
        
        if unitMeasurementView.unitMeasurement == 1 {
            productCount += 1
            coutingsButtonsView.productWeightText = "\(Int(productCount)) шт"
          } else if unitMeasurementView.unitMeasurement == 2 {  // шт
              productWeight += 0.1
              productWeight = round(productWeight * 10) / 10.0
              coutingsButtonsView.productWeightText = "\(productWeight) кг"
          }
    }
}
