//
//  ChantsViewController.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 05.11.2023.
//

// for future usage - never name group 'Resources' - it craches all the project

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        
        return tableView
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioViewModel = AudioViewModel()

    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
}

private extension ChantsViewController {
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)

        ])
    }
}

extension ChantsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        
        cell.configure(team, delegate: self)
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    func didTapPlayback(for team: Team) {
        audioViewModel.playback(for: team)
        teamsViewModel.togglePlatButton(for: team)
        tableView.reloadData()
    }
}
