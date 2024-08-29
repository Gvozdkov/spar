//
//  UpdateUniversalUIElements.swift
//  Spar
//
//  Created by Алексей Гвоздков on 19.08.2024.
//

import UIKit

class UpdateUniversalUIElements {
    func updateDiscountLabel(discountPrice: Int, discountLabel: UILabel) {
        if discountPrice > 0 && discountPrice <= 100 {
            discountLabel.text = String(discountPrice) + "%"
        } else {
            discountLabel.isHidden = false
        }
    }
    
    func updateRatingLabel(ratingLabel: UILabel, ratingStack: UIStackView, rating: Float) {
        if rating > 0.0 {
            ratingLabel.text = String(rating)
        } else {
            ratingStack.isHidden = true
        }
    }
    
    func updatePrice(newPriceIntegerLabel: UILabel, newPriceWholeLabel: UILabel, discountedPrice: Float) {
        let priceComponents = String(format: "%.2f", discountedPrice).split(separator: ".")
        
        if let integerPart = priceComponents.first, let fractionalPart = priceComponents.last {
            newPriceIntegerLabel.text = String(integerPart)
            newPriceWholeLabel.text = String(fractionalPart)
        }
    }
    
    func updateOldPriceLabel(oldPrice: Float, discountedPrice: Float, oldPriceLabel: UILabel) {
        if oldPrice != 0 && oldPrice > discountedPrice {
            
            let formattedOldPrice = String(format: "%.2f", oldPrice)
            
            let attributedString = NSAttributedString(
                string: formattedOldPrice,
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue
                ]
            )
            oldPriceLabel.attributedText = attributedString
            oldPriceLabel.isHidden = false
        } else {
            oldPriceLabel.isHidden = true
        }
    }
    
    func updateUnitView(unitView: UIView, unitMeasurement: Int) {
        var text = ""

        switch unitMeasurement {
        case 1:
            text = "шт"
        case 2:
            text = "кг"
        default:
            text = ""
        }

        if let label = unitView.subviews.last as? UILabel {
            label.text = text
        }
    }
    
    func updatePromotionalView(promotionalView: UIView, promotion: Int) {
        switch promotion {
        case 1:
            promotionalView.isHidden = false
            promotionalView.backgroundColor = Colors.purplePromotional
            if let label = promotionalView.subviews.first as? UILabel {
                label.text = "Новинка"
            }
        case 2:
            promotionalView.isHidden = false
            promotionalView.backgroundColor = Colors.greenPromotional
            if let label = promotionalView.subviews.first as? UILabel {
                label.text = "Цена по карте"
            }
        case 3:
            promotionalView.isHidden = false
            promotionalView.backgroundColor = Colors.redPromotional
            if let label = promotionalView.subviews.first as? UILabel {
                label.text = "Удар по ценам"
            }
        default:
            promotionalView.isHidden = true
        }
    }
    
    func updateCountryOriginLabel(city: Int, label: UILabel) {
        switch city {
        case 1:
            label.text = "Россия 🇷🇺"
        case 2:
            label.text = "Италия 🇮🇹"
        case 3:
            label.text = "Китай 🇨🇳"
        default:
            label.text = ""
        }
    }
    
    func maxLengthProductName(_ label: UILabel, _ text: String) {
        let truncatedText = String(text.prefix(40))
        label.text = truncatedText
    }
}
