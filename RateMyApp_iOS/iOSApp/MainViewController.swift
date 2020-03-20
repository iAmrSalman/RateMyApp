//
//  MainViewController.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RateMyAppUIKit
import RateMyAppKit
import RxSwift

public class MainViewController: NiblessNavigationController {
    
    // MARK: - Properties
    
    // View Model
    let viewModel: MainViewModel
    
    // Child View Controllers
    let searchViewController: SearchViewController
    
    // State
    let disposeBag = DisposeBag()
    
    // Factories
    let detailsViewControllerFactory: (App) -> DetailsViewController
    
    public init(viewModel: MainViewModel,
                searchViewController: SearchViewController,
                detailsViewControllerFactory: @escaping (App) -> DetailsViewController) {
        self.viewModel = viewModel
        self.searchViewController = searchViewController
        self.detailsViewControllerFactory = detailsViewControllerFactory
        super.init()
    }
    
    func subscribe(to observable: Observable<MainNavigationAction>) {
        observable
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] view in
                guard let `self` = self else { return }
                self.respond(to: view)
            })
            .disposed(by: disposeBag)
    }
    
    func respond(to navigationAction: MainNavigationAction) {
        switch navigationAction {
        case .present(let view): present(view: view)
        case .presented: break
        }
    }
    
    public func present(view: MainView) {
        switch view {
        case .search: presentSearch()
        case .details(let app): presentAppDetails(for: app)
        }
    }
    
    public func presentSearch() {
        pushViewController(searchViewController, animated: true)
    }
    
    public func presentAppDetails(for app: App) {
        let detailsViewController = detailsViewControllerFactory(app)
        pushViewController(detailsViewController, animated: true)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }
    
    private func observeViewModel() {
        let observable = viewModel.view.distinctUntilChanged()
        subscribe(to: observable)
    }
    
}
