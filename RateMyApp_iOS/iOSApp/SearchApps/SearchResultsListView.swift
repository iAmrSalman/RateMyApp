//
//  SearchResultsListView.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RateMyAppKit
import RateMyAppUIKit
import RxCocoa
import RxSwift
import SnapKit
import Kingfisher

class SearchResultsListView: NiblessView {
    
    // MARK: - Properties
    let viewModel: SearchAppsViewModel
    
    //State
    let disposeBag = DisposeBag()
    
    //Views
    lazy var resultsTable: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchCell.self, forCellReuseIdentifier: "SearchCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = spinner
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SearchAppsViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        constructHierarchy()
        activateConstraints()
        bindFieldsToViewModel()
        
        backgroundColor = .white
    }
    
    private func constructHierarchy() {
        addSubview(resultsTable)
    }
    
    private func activateConstraints() {
        spinner.frame = CGRect(origin: .zero, size: CGSize(width: resultsTable.bounds.width, height: CGFloat(44)))
        
        resultsTable.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
        }
    }
    
    func bindFieldsToViewModel() {
        bindSpinner()
        bindResultsTable()
    }
    
    func bindSpinner() {
        viewModel.isLoading.bind(to: spinner.rx.isAnimating).disposed(by: disposeBag)
    }
    
    func bindResultsTable() {
        viewModel.appList.bind(to: resultsTable.rx.items(cellIdentifier: "SearchCell", cellType: SearchCell.self)) { _, model, cell in
            cell.titleLabel.text = model.trackName
            cell.descriptionLabel.text = model.description
            cell.icon.kf.setImage(with: URL(string: model.artworkUrl512 ?? ""))
        }
        .disposed(by: self.disposeBag)
        
        resultsTable.rx.itemSelected
            .asDriver()
            .drive(onNext: { [weak self] indexPath in
                guard let `self` = self else { return }
                defer {
                    self.resultsTable.deselectRow(at: indexPath, animated: true)
                }
                self.viewModel.selectedApp(self.viewModel.appList.value[indexPath.row])
            })
            .disposed(by: disposeBag)
    }
    
}
