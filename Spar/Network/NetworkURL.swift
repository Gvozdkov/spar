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
            return URL(string: "https://run.mocky.io/v3/8b6ff498-5ca6-4bfe-9cac-3a0edf9ecc6a")
        }
    }
}

