//
//  RepositoryCell.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {
    
    
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraints()
        setupConfigurations()
    }
    
    
    
    private lazy var repositoryPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryOwnerLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 13)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryStarsImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "star")
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryStarsAmountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryForksImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "fork")
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryForksAmountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryPhotoImageView.image = nil
        repositoryNameLabel.text = ""
        repositoryStarsAmountLabel.text = ""
        repositoryOwnerLabel.text = ""
        repositoryDescriptionLabel.text = ""
        repositoryForksAmountLabel.text = ""
    }
    
    func configure(viewModel: TopListRepositoriesModel.RepositoryCellViewModel) {
        repositoryNameLabel.text = viewModel.name
        repositoryOwnerLabel.text = viewModel.login
        repositoryStarsAmountLabel.text = "\(viewModel.stargazersCount)"
        repositoryForksAmountLabel.text = "\(viewModel.forksCount)"
        repositoryDescriptionLabel.text = viewModel.description
        
        if let photoUrl = URL(string: viewModel.avatarUrl) {
            repositoryPhotoImageView.sd_setImage(with: photoUrl)
        }
    }
    
    func setupViews() {
        addSubview(repositoryPhotoImageView)
        addSubview(repositoryNameLabel)
        addSubview(repositoryOwnerLabel)
        addSubview(repositoryStarsImage)
        addSubview(repositoryStarsAmountLabel)
        addSubview(repositoryForksImage)
        addSubview(repositoryForksAmountLabel)
        addSubview(repositoryDescriptionLabel)
    }
    
    func setupConstraints() {

        
        NSLayoutConstraint.activate([
            repositoryPhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            repositoryPhotoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            repositoryPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            repositoryPhotoImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([repositoryNameLabel.topAnchor.constraint(equalTo: repositoryPhotoImageView.topAnchor, constant: 2),
                                     repositoryNameLabel.leadingAnchor.constraint(equalTo: repositoryPhotoImageView.trailingAnchor, constant: 8),
                                     repositoryNameLabel.trailingAnchor.constraint(equalTo: repositoryStarsAmountLabel.leadingAnchor, constant: 8),
                                     repositoryNameLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([repositoryStarsImage.topAnchor.constraint(equalTo: repositoryNameLabel.topAnchor, constant: 0),
                                     repositoryStarsImage.leadingAnchor.constraint(equalTo: repositoryNameLabel.trailingAnchor, constant: 8),
                                     repositoryStarsImage.trailingAnchor.constraint(equalTo: repositoryStarsAmountLabel.leadingAnchor, constant: 8),
                                     repositoryStarsImage.bottomAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor),
                                     repositoryStarsImage.widthAnchor.constraint(equalToConstant: 15),
                                     repositoryStarsImage.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([repositoryStarsAmountLabel.topAnchor.constraint(equalTo: repositoryStarsImage.topAnchor),
                                     repositoryStarsAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     repositoryStarsAmountLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([repositoryOwnerLabel.topAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor, constant: 2),
                                     repositoryOwnerLabel.leadingAnchor.constraint(equalTo: repositoryNameLabel.leadingAnchor),
                                     repositoryOwnerLabel.trailingAnchor.constraint(equalTo: repositoryNameLabel.trailingAnchor),
                                     repositoryOwnerLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([repositoryForksImage.topAnchor.constraint(equalTo: repositoryOwnerLabel.topAnchor, constant: 0),
                                     repositoryForksImage.leadingAnchor.constraint(equalTo: repositoryOwnerLabel.trailingAnchor, constant: 8),
                                     repositoryForksImage.trailingAnchor.constraint(equalTo: repositoryStarsImage.trailingAnchor),
                                     repositoryForksImage.widthAnchor.constraint(equalToConstant: 15),
                                     repositoryForksImage.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([repositoryForksAmountLabel.topAnchor.constraint(equalTo: repositoryForksImage.topAnchor, constant: 0),
                                     repositoryForksAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     repositoryForksAmountLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([repositoryDescriptionLabel.topAnchor.constraint(equalTo: repositoryOwnerLabel.bottomAnchor, constant: 8),
                                     repositoryDescriptionLabel.leadingAnchor.constraint(equalTo: repositoryPhotoImageView.trailingAnchor, constant: 8),
                                     repositoryDescriptionLabel.trailingAnchor.constraint(equalTo: repositoryForksAmountLabel.trailingAnchor),
                                     repositoryDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
    }
    
    func setupConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}



