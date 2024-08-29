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
            return URL(string: "https://run.mocky.io/v3/656f90f0-54cb-4f02-9e40-75ab31842074")
        }
    }
}

