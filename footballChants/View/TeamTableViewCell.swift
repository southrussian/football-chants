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
    
    private lazy var infoLabelView: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.numberOfLines = 0
        labelView.font = .systemFont(ofSize: 12, weight: .medium)
        labelView.textColor = .white
        return labelView
    }()
}
