//
//  TeamDetailViewController.swift
//  NBA App
//
//  Created by neopandu on 02/05/20.
//  Copyright © 2020 neo studio ID. All rights reserved.
//

import UIKit

class TeamDetailViewController: UIViewController {

    @IBOutlet weak var imgBannerView: UIImageView!
    @IBOutlet weak var imgLogoView: UIImageView!
    
    @IBOutlet weak var lbTeamName: UILabel!
    @IBOutlet weak var lbStadium: UILabel!
    @IBOutlet weak var txtDescriptions: UITextView!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let res = team {
            imgBannerView.load(url: res.stadiumImageUrl ?? res.bannerUrl, onWillLoad: nil)
            imgLogoView.load(url: res.logoUrl, onWillLoad: nil)
            lbTeamName.text = res.teamName
            lbStadium.text = res.stadium
            txtDescriptions.text = res.teamDesc
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
