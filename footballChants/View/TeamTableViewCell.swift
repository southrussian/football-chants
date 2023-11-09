//
//  TeamTableViewCell.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 07.11.2023.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var badgeView: UIImageView = {
        let badgeView = UIImageView()
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.contentMode = .scaleAspectFit
        return badgeView
    }()
    
    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.tintColor = .white
        return playButton
    }()
    
    private lazy var jobLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 12, weight: .light)
        labelView.textColor = .white
        return labelView
    }()
    
    private lazy var foundedLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 12, weight: .light)
        labelView.textColor = .white
        return labelView
    }()
    
    private lazy var nameLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 10, weight: .bold)
        labelView.textColor = .white
        return labelView
    }()
    
    private lazy var infoLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 12, weight: .medium)
        labelView.textColor = .white
        return labelView
    }()
    
    func configure() {
        containerView.backgroundColor = TeamType.arsenal.background
        
        nameLabelView.text = "Arsenal"
        foundedLabelView.text = "1900"
        jobLabelView.text = "Head Coach"
        infoLabelView.text = "sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text "
        
        self.contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabelView)
        stackView.addArrangedSubview(foundedLabelView)
        stackView.addArrangedSubview(jobLabelView)
        stackView.addArrangedSubview(infoLabelView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        ])

    }
}
