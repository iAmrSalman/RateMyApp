//
//  DetailsView.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2020 Amr Salman. All rights reserved.
//

import UIKit
import RateMyAppKit
import RateMyAppUIKit
import SnapKit
import Kingfisher

class DetailsView: NiblessView {
    
    // MARK: - Properties
    let app: App
    
    //Views
    lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var icon: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, app: App) {
        self.app = app
        super.init(frame: frame)
        
        constructHierarchy()
        activateConstraints()
        configure()
        
        backgroundColor = .white
    }
    
    private func constructHierarchy() {
        addSubview(innerView)
        innerView.addSubview(icon)
        innerView.addSubview(titleLabel)
        innerView.addSubview(descriptionLabel)
    }
    
    private func activateConstraints() {
        innerView.snp.makeConstraints { maker in
            maker.edges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        icon.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview()
            maker.width.height.equalTo(64)
        }
        titleLabel.snp.makeConstraints { maker in
            maker.top.trailing.equalToSuperview()
            maker.leading.equalTo(icon.snp.trailing).offset(10)
        }
        descriptionLabel.snp.makeConstraints { maker in
            maker.trailing.leading.equalTo(titleLabel)
            maker.bottom.equalToSuperview()
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }
    
    private func configure() {
        titleLabel.text = app.trackName
        descriptionLabel.text = app.description
        icon.kf.setImage(with: URL(string: app.artworkUrl512 ?? ""))
    }

}
