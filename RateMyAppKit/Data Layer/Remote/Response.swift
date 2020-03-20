//
//  Response.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2020 Amr Salman. All rights reserved.
//

import Foundation

public struct Response<T: Codable>: Codable {
    
    // MARK: - Properties
    
    let list: [T]?
    let count: Int?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
        case count
        case errorMessage
    }
}
