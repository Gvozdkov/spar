//
//  ShopViewModel.swift
//  Spar
//
//  Created by Алексей Гвоздков on 14.08.2024.
//

import Foundation

final class ShopViewModelL {
    var onDataLoaded: (() -> Void)?
    
    private(set) var products = [ProductModel]()
    private var likeAndShoppingListProducts = [LikeAndShoppingListModel]()
    
    func fetchData() {
        guard let url = NetworkURL.mocProducts.url else {
            print("Invalide url")
            return
        }
        
        NetworkManager.shared.fatchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let mokProducts = try decoder.decode([ProductModel].self, from: data)
                    self.products = mokProducts
                    //                    print(self.products)
                    DispatchQueue.main.async {
                        self.onDataLoaded?()
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
                
            case .failure(let error):
                print("Error network airRecommendationFeed \(error)")
            }
        }
    }
    
    func numbersOfItem() -> Int {
        return products.count
    }
    
    private func searchLikeAndShoppingList(id: Int) -> LikeAndShoppingListModel? {
        for searchID in likeAndShoppingListProducts {
            if searchID.id == id {
                return searchID
            }
        }
        return nil
    }
}

