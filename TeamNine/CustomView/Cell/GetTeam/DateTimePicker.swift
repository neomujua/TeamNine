//
//  dateTimePicker.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/16.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class DateTimePicker: UITableViewCell, TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier = .dateTimePicker

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDisplayItem(item: TableItemPresentable) {
        //dateTimePicker = .some(UIDatePicker())
    }

}
