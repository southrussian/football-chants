//
//  Team.swift
//  footballChants
//
//  Created by Danil Peregorodiev on 07.11.2023.
//

import Foundation

struct Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
}
