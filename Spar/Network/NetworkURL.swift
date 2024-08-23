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
            return URL(string: "https://run.mocky.io/v3/fff3af8c-e80b-48fb-ba91-3a480a866d53")
        }
    }
}

