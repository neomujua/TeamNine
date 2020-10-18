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
    
    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var moreTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDisplayItem(item: TableCellPresentable) {
        moreTitleLabel.text = item.title
        moreImageView.image = UIImage(named: item.imageName ?? "default")
        
    }
}
