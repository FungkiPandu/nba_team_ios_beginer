//
//  TeamsRepository.swift
//  NBA App
//
//  Created by neopandu on 26/04/20.
//  Copyright © 2020 neo studio ID. All rights reserved.
//

import Foundation

func getTeams() -> [Team] {
    let rawString = TeamsResponse.replacingOccurrences(of: "\r\n", with: "\n")
    let jsonData = rawString.data(using: .utf8)!
    let teams: [Team] = try! JSONDecoder().decode([Team].self, from: jsonData)
    return teams
}
