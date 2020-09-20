//
//  TeamItem.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/19.
//  Copyright © 2020 이현호. All rights reserved.
//

import Foundation

struct TeamItem {
    let title: String
    let contents: String?
    let gameStartTime: Date?
    let gamePlayTime: Int
    let place: String
    let address: String?
    let tesmSize: Int
    let teamSpace: Int
    let gameCategory: SportType
    let imageUrl: String
    let ownerName: String
}

enum SportType {
    case soccer
    case baseball
}
