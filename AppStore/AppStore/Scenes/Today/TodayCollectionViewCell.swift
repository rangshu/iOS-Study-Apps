//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by SooRin Kim on 2022/02/03.
//

import UIKit
import Kingfisher
import SnapKit

final class TodayCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(today: Today) {
        setupSubViews()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        subTitleLabel.text = today.subTitle
        descriptionLabel.text = today.description
        titleLabel.text = today.title
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
    }
}

private extension TodayCollectionViewCell {
    func setupSubViews() {
        [imageView, titleLabel, subTitleLabel, descriptionLabel].forEach {
            addSubview($0)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(24.0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}