//
//  RMASearchRepository.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import PromiseKit

public class RMASearchRepository: SearchRepository {
    
    let remoteAPI: SearchRemoteAPI
    
    public init(remoteAPI: SearchRemoteAPI) {
        self.remoteAPI = remoteAPI
    }
    
    public func search(term: String) -> Promise<[App]> {
        return remoteAPI.search(term: term).compactMap { $0.list }
    }
}
