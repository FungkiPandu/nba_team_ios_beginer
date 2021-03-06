//
//  ViewController.swift
//  NBA App
//
//  Created by neopandu on 26/04/20.
//  Copyright © 2020 neo studio ID. All rights reserved.
//

import UIKit

var nbaTeams = getTeams().map({team -> TeamWrapper in TeamWrapper(team: team)})

class ViewController: UIViewController {

    @IBOutlet weak var tbTeams: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "NBA Teams"
        
        // Set data source (adapter)
        tbTeams.dataSource = self
        
        // set delegate
        tbTeams.delegate = self
        
        // Set xib file (cell view)
        tbTeams.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamCell")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nbaTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamTableViewCell
        
        let team = nbaTeams[indexPath.row].team
        cell.TeamName.text = team.teamName
        cell.TeamStadium.text = team.stadium
        if let logo = nbaTeams[indexPath.row].logoImage {
            cell.TeamLogo.image = logo
        } else {
            cell.TeamLogo.load(url: team.logoUrl) { image in
                nbaTeams[indexPath.row].logoImage = image
            }
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = TeamDetailViewController(nibName: "TeamDetailViewController", bundle: nil)
        detail.team = nbaTeams[indexPath.row].team
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
