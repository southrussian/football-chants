//
//  Manager.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 07.11.2023.
//

import Foundation

struct Manager {
    let name: String
    let job: Job
}

enum Job: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}
