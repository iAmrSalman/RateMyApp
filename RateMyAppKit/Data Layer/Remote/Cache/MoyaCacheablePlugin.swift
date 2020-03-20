//
//  MoyaCacheablePlugin.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2020 Amr Salman. All rights reserved.
//

import Foundation
import Moya

final class MoyaCacheablePlugin: PluginType {
    
    init() { }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let moyaCachableProtocol = target as? MoyaCacheable {
            var cachableRequest = request
            cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
            return cachableRequest
        }
        return request
    }
}
