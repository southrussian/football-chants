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
    
    private lazy var jobLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 10, weight: .light)
        labelView.textColor = .white
        return labelView
    }()
    
    private lazy var foundedLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 10, weight: .light)
        labelView.textColor = .white
        return labelView
    }()
    
    private lazy var nameLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 10, weight: .light)
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
        infoLabelView.text = "sample text"
        
        self.containerView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabelView)
        stackView.addArrangedSubview(foundedLabelView)
        stackView.addArrangedSubview(jobLabelView)
        stackView.addArrangedSubview(infoLabelView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -8)
        ])

    }
}
