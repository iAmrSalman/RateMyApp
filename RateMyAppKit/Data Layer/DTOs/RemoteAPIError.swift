//
//  RemoteAPIError.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import Foundation

enum RemoteAPIError: Error {
  
  case unknown
  case createURL
  case httpError
  case parsingError
}
