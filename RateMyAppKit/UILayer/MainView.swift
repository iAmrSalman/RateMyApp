//
//  MainView.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import Foundation

public typealias AppId = String

public enum MainView {
    case search, details(app: App)
}

extension MainView: Equatable {
  
  public static func == (lhs: MainView, rhs: MainView) -> Bool {
    switch (lhs, rhs) {
    case (.search, .search): return true
    case (details(let lhsApp), details(let rhsApp)):
        return lhsApp.bundleId == rhsApp.bundleId
    case (.details, .search): return false
    case (.search, .details): return false
        
    }
  }
}
