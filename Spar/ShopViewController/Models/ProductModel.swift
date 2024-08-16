//
//  ProductModel.swift
//  Spar
//
//  Created by Алексей Гвоздков on 14.08.2024.
//

import Foundation

struct ProductModel: Decodable {
    let id: Int
    let name: String
    let countryOrigin: String
    let photo: String
    let rating: Float
    let comments: Int
    let discountedPrice: Float
    let oldPrice: Float
    let unitMeasurement: Int
    let discount: Int
    let promotionalProduct: Int
}
