//
//  DetailsViewController.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RateMyAppUIKit
import RateMyAppKit
import RxSwift

public class DetailsViewController: NiblessViewController {
    
    // MARK: - Properties
    let app: App
    
    // MARK: - Methods
    
    init(app: App) {
        self.app = app
        super.init()
    }
    
    public override func loadView() {
        view = DetailsView(app: app)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

}
