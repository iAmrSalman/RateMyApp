//
//  MainViewModel.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import RxSwift

public typealias MainNavigationAction = NavigationAction<MainView>

public class MainViewModel {
    
    // MARK: - Properties
    
    public var view: Observable<MainNavigationAction> { return viewSubject.asObserver() }
    private let viewSubject = BehaviorSubject<MainNavigationAction>(value: .present(view: .search))
    
    // MARK: - Methods
    
    public init() {}
    
    public func uiPresented(mainView: MainView) {
      viewSubject.onNext(.presented(view: mainView))
    }
}

extension MainViewModel: MainViewResponder {
    public func shouldNavigateToAppDetails(app: App) {
        viewSubject.onNext(.present(view: .details(app: app)))
  }
}
