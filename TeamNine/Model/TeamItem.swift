//
//  TeamItem.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/19.
//  Copyright © 2020 이현호. All rights reserved.
//

import Foundation
import Firebase

struct TeamItem {
    
    let ref: DatabaseReference?
    let key: String
    let title: String
    let contents: String?
    let gameStartTime: String?
    let gamePlayTime: Int
    let place: String
    let address: String?
    let teamSize: Int
    let teamSpace: Int
    let gameCategory: String
    let imageUrl: String
    let ownerName: String
    
    //데이터스냅샷을 받아와서 그 데이터로 설정해주는 코드입니다.
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let contents = value["contents"] as? String,
            let gameStartTime = value["gameStartTime"] as? String,
            let gamePlayTime = value["gamePlayTime"] as? Int,
            let place = value["place"] as? String,
            let address = value["address"] as? String,
            let teamSize = value["teamSize"] as? Int,
            let teamSpace = value["teamSpace"] as? Int,
            let gameCategory = value["gameCategory"] as? String,
            let imageUrl = value["imageUrl"] as? String,
            let ownerName = value["ownerName"] as? String else {
            return nil
        }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.contents = contents
        self.gameStartTime = gameStartTime
        self.gamePlayTime = gamePlayTime
        self.place = place
        self.address = address
        self.teamSize = teamSize
        self.teamSpace = teamSpace
        self.gameCategory = gameCategory
        self.imageUrl = imageUrl
        self.ownerName = ownerName
    }
}

enum SportType {
    case soccer
    case baseball
}
