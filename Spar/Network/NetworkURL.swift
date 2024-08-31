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
            return URL(string: "https://run.mocky.io/v3/a870a382-8f88-4023-b605-b58e4cd851e8")
        }
    }
}

