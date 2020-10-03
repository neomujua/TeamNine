//
//  MoreListCell.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/03.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class MoreListCell: UITableViewCell, TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier = .moreListCell
    var action: EmptyAction?
    
    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var moreTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    func setDisplayItem(item: TableItemPresentable) {
        moreTitleLabel.text = "test"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
