//
//  TeamTableViewCell.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 07.11.2023.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlayback(for team: Team)
}

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
        labelView.font = .systemFont(ofSize: 18, weight: .heavy)
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
    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = 10
    }
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configure(_ item: Team, delegate: TeamTableViewCellDelegate) {
        
        self.delegate = delegate
        self.team = item
        
        playButton.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        badgeView.image = item.id.badge
        playButton.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLabelView.text = item.name
        foundedLabelView.text = item.founded
        jobLabelView.text = "Current \(item.manager.job.rawValue) is \(item.manager.name)"
        infoLabelView.text = item.info
        
        self.contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(badgeView)
        containerView.addSubview(playButton)
        
        stackView.addArrangedSubview(nameLabelView)
        stackView.addArrangedSubview(foundedLabelView)
        stackView.addArrangedSubview(jobLabelView)
        stackView.addArrangedSubview(infoLabelView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            badgeView.heightAnchor.constraint(equalToConstant: 50),
            badgeView.widthAnchor.constraint(equalToConstant: 50),
            badgeView.topAnchor.constraint(equalTo: stackView.topAnchor),
            badgeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -8),
            
            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])

    }
    
    @objc func didTapPlayback() {
        if let team = team {
            delegate?.didTapPlayback(for: team)

        }
    }
}
