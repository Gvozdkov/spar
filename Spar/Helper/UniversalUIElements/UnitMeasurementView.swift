//
//  UnitMeasurementView.swift
//  Spar
//
//  Created by Алексей Гвоздков on 14.08.2024.
//

import UIKit

class UnitMeasurementView: UIView {
    private let universalUIElements = UniversalUIElements()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGrayButton
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var piecesLabel: UILabel = {
        let label = universalUIElements.createLabel(fontSize: 14,
                                                    weight: .regular,
                                                    textColor: .black)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .white
        label.text = "Шт"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var kilogramsLabel: UILabel = {
        let label = universalUIElements.createLabel(fontSize: 14,
                                                    weight: .regular,
                                                    textColor: Colors.grayLine)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.text = "Кг"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [piecesLabel, kilogramsLabel])
        stack.axis = .horizontal
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
    
    func constraintsSettingsView() {
        addSubview(containerView)
        containerView.addSubview(labelStack)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labelStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            labelStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            piecesLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            piecesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2),
            piecesLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2),
            
            kilogramsLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            kilogramsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2),
            kilogramsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2),
        ])
    }
}
