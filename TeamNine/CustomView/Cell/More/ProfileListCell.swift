//
//  ProfileListCell.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/03.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class ProfileListCell: UITableViewCell, TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier = .profileListCell
    
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var profileContentText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setDisplayItem(item: TableCellPresentable) {
        profileTitleLabel.text = item.title
        profileContentText.text = item.subtitle
    }
 
}
