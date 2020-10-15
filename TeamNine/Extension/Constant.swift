//
//  UITableView+Extension.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/03.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

enum Constant {
    enum CellIdentifier: String {
        case moreListCell = "MoreListCell"
        case profileListCell = "ProfileListCell"
        case settingsListCell = "SettingsListCell"
        case getTeamInputCell = "GetTeamInputCell"
        case dateTimePicker = "DateTimePicker"
        
        var cellClass: AnyClass? {
            return NSClassFromString("teamNine.\(rawValue)")
        }
        
        var identifier: String {
            return rawValue
        }
    }
}

extension UITableView {
    func registerNib(cellIdentifier identifier: Constant.CellIdentifier) {
        register(UINib(nibName: identifier.identifier, bundle: nil), forCellReuseIdentifier: identifier.identifier)
    }
}
