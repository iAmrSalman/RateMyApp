//
//  ErrorMessage.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import Foundation

public struct ErrorMessage: Error {
  
  // MARK: - Properties
  public let id: UUID
  public let title: String
  public let message: String
  
  // MARK: - Methods
  public init(title: String, message: String) {
    self.id = UUID()
    self.title = title
    self.message = message
  }
}

extension ErrorMessage: Equatable {
  
  public static func == (lhs: ErrorMessage, rhs: ErrorMessage) -> Bool {
    return lhs.id == rhs.id
  }
}
