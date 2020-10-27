//
//  PullRequestCell.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 21/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit

import SDWebImage

class PullRequestCell: UITableViewCell {
    
    // MARK: - Properties
    
    private lazy var authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var pullRequestTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        label.textColor = UIColor.black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.accessibilityHint = .pullRequestTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionPullRequestLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 13)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorImageView.image = nil
        pullRequestTitleLabel.text = ""
        descriptionPullRequestLabel.text = ""
        authorNameLabel.text = ""
    }
    
    // MARK: - Public methods
    
    func configure(viewModel: ListPullRequest.ViewModel) {
        pullRequestTitleLabel.text = viewModel.title
        descriptionPullRequestLabel.text = viewModel.body
        authorNameLabel.text = viewModel.user
        if let avatarUrl = URL(string: viewModel.avatarUrl) {
            authorImageView.sd_setImage(with: avatarUrl, placeholderImage: UIImage(named: "github_logo_placeholder"))
        }
       
    }
    
    // MARK: - Private methods
    
    private func setupCell() {
        let padding: CGFloat = 6
        
        authorImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(authorImageView)
        
        NSLayoutConstraint.activate([
            authorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            authorImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            authorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            authorImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        pullRequestTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pullRequestTitleLabel)
        NSLayoutConstraint.activate([
            pullRequestTitleLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: padding),
            pullRequestTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            pullRequestTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
        ])
        
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(authorNameLabel)
        NSLayoutConstraint.activate([
            authorNameLabel.topAnchor.constraint(equalTo: pullRequestTitleLabel.bottomAnchor, constant: 0),
            authorNameLabel.leadingAnchor.constraint(equalTo: pullRequestTitleLabel.leadingAnchor),
            authorNameLabel.trailingAnchor.constraint(equalTo: pullRequestTitleLabel.trailingAnchor),        
        ])
        
        descriptionPullRequestLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionPullRequestLabel)
        NSLayoutConstraint.activate([
            descriptionPullRequestLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: padding),
            descriptionPullRequestLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionPullRequestLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 0),
            descriptionPullRequestLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        
        
        
        
        
        
        
    }
    
}
