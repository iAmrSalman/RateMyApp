//
//  AppDependencyContainer.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RateMyAppKit

public class AppDependencyContainer {
    
    // MARK: - Properties
    
    // Long-lived dependencies
    let sharedMainViewModel: MainViewModel
    
    // MARK: - Methods
    public init() {
        func makeMainViewModel() -> MainViewModel {
            return MainViewModel()
        }
        
        self.sharedMainViewModel = makeMainViewModel()
    }
}

// MARK: - MainViewController
public extension AppDependencyContainer {
    func makeMainViewController() -> MainViewController {
        
        let detailsViewControllerFactory = { (app: App) -> DetailsViewController in
            return self.makeDetailsViewController(app: app)
        }
        
        let searchViewController = makeSearchViewController()
        
        return MainViewController(viewModel: self.sharedMainViewModel,
                                  searchViewController: searchViewController,
                                  detailsViewControllerFactory: detailsViewControllerFactory)
    }
}

// MARK: - SearchViewController
extension AppDependencyContainer {
    func makeSearchViewController() -> SearchViewController {
        let remoteAPI = ItunesSearchRemoteAPI()
        let repository = RMASearchRepository(remoteAPI: remoteAPI)
        let viewModel = SearchAppsViewModel(repository: repository, responder: sharedMainViewModel)
        return SearchViewController(viewModel: viewModel)
    }
}

// MARK: - DetailsViewController
extension AppDependencyContainer {
    func makeDetailsViewController(app: App) -> DetailsViewController {
        return DetailsViewController(app: app)
    }
}
