//
//  ViewControllerContainment.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
  
  // MARK: - Methods
  public func addFullScreen(childViewController child: UIViewController) {
    guard child.parent == nil else {
      return
    }
    
    addChild(child)
    view.addSubview(child.view)
    
    child.view.snp.makeConstraints { maker in
        maker.edges.equalToSuperview()
    }
    
    child.didMove(toParent: self)
  }
  
  public func remove(childViewController child: UIViewController?) {
    guard let child = child else {
      return
    }
    
    guard child.parent != nil else {
      return
    }
    
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}
