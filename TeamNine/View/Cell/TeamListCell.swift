//
//  TeamListCell.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/15.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class TeamListCell: UITableViewCell {
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var enrollButton: UIButton!
    @IBOutlet weak var teamGender: UILabel!
    @IBOutlet weak var gameSize: UILabel!
    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var userLevel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gameTime.text = "20:30"
        gameTitle.text = "첫 게임을 모집합니다."
        enrollButton.titleLabel?.text = "마감임박"
        teamGender.text = "남성"
        gameSize.text = "6vs6"
        gameType.text = "매치"
        userLevel.text = "일반 (Lv 1~5)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
