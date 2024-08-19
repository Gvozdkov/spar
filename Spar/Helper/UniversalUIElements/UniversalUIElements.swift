//
//  UniversalUIElements.swift
//  Spar
//
//  Created by Алексей Гвоздков on 10.08.2024.
//

import UIKit

class UniversalUIElements {
    func setupCellAppearance(for contentView: UIView) {
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        let topLeftRadius: CGFloat = 16
        let topRightRadius: CGFloat = 16
        let bottomLeftRadius: CGFloat = 20
        let bottomRightRadius: CGFloat = 20
        
        let maskPath = UIBezierPath()
        let width = contentView.bounds.width
        let height = contentView.bounds.height
        
        // Верхний левый угол
        maskPath.move(to: CGPoint(x: 0, y: topLeftRadius))
        maskPath.addArc(
            withCenter: CGPoint(x: topLeftRadius, y: topLeftRadius),
            radius: topLeftRadius,
            startAngle: CGFloat.pi,
            endAngle: CGFloat.pi * 1.5,
            clockwise: true
        )
        
        // Верхний правый угол
        maskPath.addLine(to: CGPoint(x: width - topRightRadius, y: 0))
        maskPath.addArc(
            withCenter: CGPoint(x: width - topRightRadius, y: topRightRadius),
            radius: topRightRadius,
            startAngle: CGFloat.pi * 1.5,
            endAngle: 0,
            clockwise: true
        )
        
        // Нижний правый угол
        maskPath.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
        maskPath.addArc(
            withCenter: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius),
            radius: bottomRightRadius,
            startAngle: 0,
            endAngle: CGFloat.pi * 0.5,
            clockwise: true
        )
        
        // Нижний левый угол
        maskPath.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
        maskPath.addArc(
            withCenter: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius),
            radius: bottomLeftRadius,
            startAngle: CGFloat.pi * 0.5,
            endAngle: CGFloat.pi,
            clockwise: true
        )
        
        maskPath.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        contentView.layer.mask = maskLayer
    }
    
    func createShadowContainerView() -> UIView {
        let view = UIView()
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func createProductImageView(widthAnchor: CGFloat, heightAnchor: CGFloat) -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: widthAnchor, height: heightAnchor))
        let defaultImage = renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(x: 0, y: 0, width: widthAnchor, height: heightAnchor))
        }
        
        image.image = defaultImage
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: widthAnchor),
            image.heightAnchor.constraint(equalToConstant: heightAnchor),
        ])
        return image
    }
    
    func createRatingImageView() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "ratingStar") ?? UIImage(systemName: "star.fill")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 12).isActive = true
        image.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return image
    }
    
    func createLabel(fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createUnitView() -> UIView {
        let currencyLabel = createLabel(fontSize: 12,
                                        weight: .bold,
                                        textColor: .black)
        currencyLabel.text = "₽"
        
        let slashLabel = createLabel(fontSize: 16,
                                     weight: .bold,
                                     textColor: .black)
        slashLabel.text = "/"
        
        let unitLabel = createLabel(fontSize: 12,
                                    weight: .bold,
                                    textColor: .black)
        unitLabel.text = "кг"
        
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(currencyLabel)
        view.addSubview(slashLabel)
        view.addSubview(unitLabel)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 20),
            view.heightAnchor.constraint(equalToConstant: 20),
            
            currencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            currencyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
            
            slashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            slashLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
            
            unitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            unitLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 9),
        ])
        
        return view
    }
    
    func createCartButton() -> UIButton {
        let cartButton = UIButton()
        cartButton.layer.cornerRadius = 18
        cartButton.backgroundColor = Colors.greenButton
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        
        let imageButton = UIImageView()
        imageButton.image = UIImage(named: "cart") ?? UIImage(systemName: "cart.fill")
        imageButton.contentMode = .scaleAspectFit
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        
        cartButton.addSubview(imageButton)
        
        NSLayoutConstraint.activate([
            cartButton.widthAnchor.constraint(equalToConstant: 48),
            cartButton.heightAnchor.constraint(equalToConstant: 36),
            
            imageButton.centerXAnchor.constraint(equalTo: cartButton.centerXAnchor),
            imageButton.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor)
        ])
        
        return cartButton
    }
    
    func createPromotionalView(color: UIColor, text: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.layer.cornerRadius = 6
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        let label = createLabel(fontSize: 10,
                                weight: .regular,
                                textColor: .white)
        label.text = text
        label.textColor = .white
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    // MARK: - Functions for updating cell components
    func updateDiscountLabel(discountPrice: Int, discountLabel: UILabel) {
        if discountPrice > 0 && discountPrice <= 100 {
            discountLabel.text = String(discountPrice) + "%"
        } else {
            discountLabel.isHidden = false
        }
    }
    
    func animatioinsProfuct(imageView: UIImageView, widthAnchor: CGFloat, heightAnchor: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            NSLayoutConstraint.deactivate(imageView.constraints.filter { $0.firstAttribute == .width || $0.firstAttribute == .height })
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: widthAnchor),
                imageView.heightAnchor.constraint(equalToConstant: heightAnchor)
            ])
            imageView.superview?.layoutIfNeeded()
        })
        imageView.superview?.layoutIfNeeded()
    }
    
    func maxLengthProductName(_ label: UILabel, _ text: String) {
        let truncatedText = String(text.prefix(44))
        label.text = truncatedText
    }
}
