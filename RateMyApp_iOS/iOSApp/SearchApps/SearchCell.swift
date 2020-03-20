//
//  SearchCell.swift
//  RateMyApp_iOS
//
//  Created by Amr Salman on 3/20/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import SnapKit

class SearchCell: UITableViewCell {
    
    lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
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
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constructView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constructView() {
        addSubview(innerView)
        innerView.addSubview(icon)
        innerView.addSubview(titleLabel)
        innerView.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        innerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(10)
        }
        icon.snp.makeConstraints { maker in
            maker.leading.top.bottom.equalToSuperview()
            maker.height.equalTo(icon.snp.width)
            maker.width.equalTo(64)
            maker.centerY.equalToSuperview()
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
    
}
