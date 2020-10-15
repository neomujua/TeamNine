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
    //let storyboard = UIStoryboard(name: "Main", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        enrollButton.setTitleColor(.white, for: .normal)
        enrollButton.layer.cornerRadius = 6.0
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func touchedEnrollButton(_ sender: Any) {
        print("touched")
    }

}
