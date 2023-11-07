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
    
}
