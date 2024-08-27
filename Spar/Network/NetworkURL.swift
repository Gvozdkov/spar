//
//  NetworkURL.swift
//  Spar
//
//  Created by Алексей Гвоздков on 15.08.2024.
//

import Foundation

enum NetworkURL {
    case mocProducts
    
    var url: URL? {
        switch self {
        case .mocProducts:
            return URL(string: "https://run.mocky.io/v3/a91f7a7c-9692-4cee-b721-b65246e4b2a0")
        }
    }
}

