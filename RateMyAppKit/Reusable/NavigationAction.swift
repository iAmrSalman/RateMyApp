//
//  NavigationAction.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import Foundation

public enum NavigationAction<ViewModelType>: Equatable where ViewModelType: Equatable {
  
  case present(view: ViewModelType)
  case presented(view: ViewModelType)
}
