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
    var teamList = [TeamItem]()
    
    @IBOutlet weak var gameTime: UILabel!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var enrollButton: UIButton!
    @IBOutlet weak var userLevel: UILabel!
    
    let teamItemReference = Database.database().reference(withPath: "team-items")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print(teamItemReference)
        //let testReference = teamItemReference.child("game1")
        //print(testReference.key)
        
        
        teamItemReference.observe(.value, with: { snapshot in
            var newItems: [TeamItem] = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let teamItem = TeamItem(snapshot: snapshot) {
                    //let title = value["title"] as? String
                    //print(asdf)
                    newItems.append(teamItem)
                }
                
            }
            print(newItems)
        })
 
        // Initialization code
//        gameReference.child("testGame").observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let gameTimeReference = value?["gameTime"] as? String ?? ""
//            let gameTitleReference = value?["gameTitle"] as? String ?? ""
//            let gameLevelReference = value?["userLevel"] as? String ?? ""
//            self.gameTime.text = gameTimeReference
//            self.gameTitle.text = gameTitleReference
//            self.enrollButton.titleLabel?.text = "마감임박"
//            self.userLevel.text = gameLevelReference
//            }) { (error) in print(error.localizedDescription)
//
//        }

//        teamItemReference.observeSingleEvent(of: .value, with: { (snapshot) in let value = snapshot.value as? NSDictionary
////            print(value)
//            print(value?.allKeys)
//            print(value?.allValues[0])
//        }) { (error) in print(error.localizedDescription)}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
