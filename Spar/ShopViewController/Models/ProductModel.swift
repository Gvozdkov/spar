//
//  ProductModel.swift
//  Spar
//
//  Created by Алексей Гвоздков on 14.08.2024.
//

import Foundation

struct ProductModel {
    let id: Float
    let name: String
    let countryOrigin: String
    let photo: String
    let rating: Int
    let comments: Int
    let discountedPrice: Int
    let oldPrice: Int
    let unitMeasurement: Int // if 1 == шт else 2 == кг,
    let discount: Int
    let promotionalProduct: Int // 1 - Цена по карте, 2 - новинка, 3 - удар по ценам
}
