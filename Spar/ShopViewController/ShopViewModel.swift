//
//  ShopViewModel.swift
//  Spar
//
//  Created by Алексей Гвоздков on 14.08.2024.
//

import Foundation

final class ShopViewModelL {
    private var products = [ProductModel]()
    private var likeAndShoppingListProducts = [LikeAndShoppingListModel]()
    
    init() {
        // загрузка из сети
    }
    
    func numbersOfItem() -> Int {
        return products.count
    }
}

