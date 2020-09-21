//
//  TeamListCell.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/15.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit
import Firebase

class TeamListCell: UITableViewCell {
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var enrollButton: UIButton!
    @IBOutlet weak var userLevel: UILabel!
    
    let gameReference = Database.database().reference(withPath: "team-items")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gameReference.child("testGame").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let gameTimeReference = value?["gameTime"] as? String ?? ""
            let gameTitleReference = value?["gameTitle"] as? String ?? ""
            let gameLevelReference = value?["userLevel"] as? String ?? ""
            self.gameTime.text = gameTimeReference
            self.gameTitle.text = gameTitleReference
            self.enrollButton.titleLabel?.text = "마감임박"
            self.userLevel.text = gameLevelReference
            }) { (error) in print(error.localizedDescription)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
