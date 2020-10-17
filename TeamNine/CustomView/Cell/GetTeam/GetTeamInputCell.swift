//
//  GetTeamInputCell.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/16.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class GetTeamInputCell: UITableViewCell, TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier = .settingsListCell
    
    @IBOutlet weak var placeholerLabel: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDisplayItem(item: TableCellPresentable) {
        placeholerLabel.placeholder = item.title
    }
}
