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
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        enrollButton.setTitleColor(.white, for: .normal)
        enrollButton.layer.cornerRadius = 6.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("hi")
        let pushVC = self.storyboard.instantiateViewController(identifier: "DetailTeamViewController")
        let parentVC = self.storyboard.instantiateViewController(identifier: "TeamListViewController")
        parentVC.navigationController?.pushViewController(pushVC, animated: true)
        // Configure the view for the selected state
    }
    @IBAction func touchedEnrollButton(_ sender: Any) {
//        let pushVC = self.storyboard.instantiateViewController(identifier: "DetailTeamViewController")
//        let parentVC = self.storyboard.instantiateViewController(identifier: "TeamListViewController")
//        parentVC.navigationController?.pushViewController(pushVC, animated: true)
        print("touched")
    }
    
    /*
     if cell!.enrollButton.isTouchInside {
         let pushVC = self.storyboard?.instantiateViewController(identifier: "DetailTeamViewController")
         self.navigationController?.pushViewController(pushVC!, animated: true)
     }
     */
}
