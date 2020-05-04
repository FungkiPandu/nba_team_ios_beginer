//
//  Team.swift
//  NBA App
//
//  Created by neopandu on 26/04/20.
//  Copyright © 2020 neo studio ID. All rights reserved.
//

import Foundation
import UIKit

struct Team : Decodable {
    let logoUrl: URL
    let bannerUrl: URL
    let teamName: String
    let teamDesc: String
    let stadium: String
    let stadiumImageUrl: URL?

    enum CodingKeys: String, CodingKey {
        case logoUrl = "strTeamBadge"
        case bannerUrl = "strTeamFanart1"
        case teamName = "strTeam"
        case teamDesc = "strDescriptionEN"
        case stadium = "strStadium"
        case stadiumImageUrl = "strStadiumThumb"
    }
}

struct TeamWrapper {
    var logoImage: UIImage?
    let team: Team
    
    init(team: Team) {
        self.team = team
    }
}
