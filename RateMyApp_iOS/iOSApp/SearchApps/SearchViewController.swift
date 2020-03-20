//
//  SearchViewController.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RateMyAppKit
import RateMyAppUIKit

public class SearchViewController: NiblessViewController {
    
    // MARK: - Properties
    let viewModel: SearchAppsViewModel
    
    // State
    let disposeBag = DisposeBag()
    
    // Views
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search"
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.searchTextField.delegate = self
        return searchController
    }()
    
    // MARK: - Methods
    
    init(viewModel: SearchAppsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func loadView() {
        view = SearchResultsListView(viewModel: viewModel)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        observeErrorMessages()
        bindFieldsToViewModel()
        title = "RateMyApp"
        navigationItem.searchController = searchController
    }
    
    func bindFieldsToViewModel() {
        bindSearchBar()
    }
    
    func bindSearchBar() {
        searchController.searchBar.rx.text.orEmpty
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let `self` = self else { return }
                self.viewModel.searchForApps(keyword: text)
            })
            .disposed(by: disposeBag)
    }
    
    func observeErrorMessages() {
        viewModel
            .errorMessages
            .asDriver { _ in fatalError("Unexpected error from error messages observable.") }
            .drive(onNext: { [weak self] errorMessage in
                guard let `self` = self else { return }
                self.present(errorMessage: errorMessage,
                             withPresentationState: self.viewModel.errorPresentation)
            })
            .disposed(by: disposeBag)
    }
}

extension SearchViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
