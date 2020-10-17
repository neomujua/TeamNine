//
//  TableItemProtocol.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/03.
//  Copyright © 2020 이현호. All rights reserved.
//

import Foundation
import UIKit

public typealias EmptyAction = () -> Void

protocol TableSectionPresentable {
    var title: String { get }
    var height: CGFloat { get }
    var items: [TableCellPresentable] { get set }
}

struct PlainSection: TableSectionPresentable {
    var height: CGFloat
    var title: String
    var items: [TableCellPresentable]
    
    init(title: String, height: CGFloat = 60, items: [TableCellPresentable]) {
        self.height = height
        self.title = title
        self.items = items
    }
}

protocol TableCellPresentable {
    var title: String { get }
    var subtitle: String? { get }
    var imageName: String? { get }
    var cellIdentifier: Constant.CellIdentifier { get }
}

protocol TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier { get set }
    func setDisplayItem(item: TableCellPresentable)
}

struct PlainCell: TableCellPresentable {
    var title: String
    var subtitle: String?
    var imageName: String?
    var cellIdentifier: Constant.CellIdentifier
    
    init(title: String, subtitle: String? = nil, imageName: String? = nil, cellIdentifier: Constant.CellIdentifier) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.cellIdentifier = cellIdentifier
    }
}
