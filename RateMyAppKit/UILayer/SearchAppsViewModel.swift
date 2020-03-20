//
//  SearchAppsViewModel.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2020 Amr Salman. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import PromiseKit

public class SearchAppsViewModel {
    
    // MARK: - Properties
    
    private let repository: SearchRepository
    private let responder: MainViewResponder
    private let errorMessagesSubject = PublishSubject<ErrorMessage>()
    private let isLoadingSubject = BehaviorRelay(value: false)

    public var errorMessages: Observable<ErrorMessage> { return self.errorMessagesSubject.asObserver() }
    public var isLoading: Observable<Bool> { return self.isLoadingSubject.asObservable() }
    public let errorPresentation = BehaviorSubject<ErrorPresentation?>(value: nil)
    public let appList = BehaviorRelay(value: [App]())

    // MARK: - Methods
    
    public init(repository: SearchRepository, responder: MainViewResponder) {
        self.repository = repository
        self.responder = responder
    }
    
    public func searchForApps(keyword: String) {
        isLoadingSubject.accept(true)
        repository.search(term: keyword)
            .done(appList.accept)
            .ensure { self.isLoadingSubject.accept(false) }
            .catch {
                guard let error = $0 as? ErrorMessage else {
                    let errorMessage = ErrorMessage(title: "Error",
                                                    message: "\($0.localizedDescription)")
                    self.present(errorMessage: errorMessage)
                    return
                }
                self.present(errorMessage: error)
        }
    }
    
    public func selectedApp(_ app: App) {
        responder.shouldNavigateToAppDetails(app: app)
    }
    
    public func present(errorMessage: ErrorMessage) {
      errorMessagesSubject.onNext(errorMessage)
    }

}
