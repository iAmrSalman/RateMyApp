//
//  SearchRepository.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import PromiseKit

public protocol SearchRepository {
    func search(term: String) -> Promise<[App]>
}
