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
    var items: [TableItemPresentable] { get set }
}

struct PlainSection: TableSectionPresentable {
    var height: CGFloat
    var title: String
    var items: [TableItemPresentable]
    
    init(title: String, height: CGFloat = 44, items: [TableItemPresentable]) {
        self.height = height
        self.title = title
        self.items = items
    }
}

protocol TableItemPresentable {
    var cellIdentifier: Constant.CellIdentifier { get }
    var title: String { get }
    var subtitle: String? { get }
    
    var action: Any? { get }
    var value: Any? { get }
    var secondaryValue: Any? { get }
    var subItems: [TableItemPresentable]? { get }
}

protocol TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier { get set }
    func setDisplayItem(item: TableItemPresentable)
}

struct PlainItem: TableItemPresentable {
    var subItems: [TableItemPresentable]?
    
    var title: String
    var subtitle: String?
    var value: Any?
    var secondaryValue: Any?
    var cellIdentifier: Constant.CellIdentifier
    var action: Any?
    var imageName: String?
    
    init(title: String, subtitle: String? = nil, imageName: String? = nil , cellIdentifier: Constant.CellIdentifier,  action: Any? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.cellIdentifier = cellIdentifier
        self.secondaryValue = imageName
        self.action = action
    }
    
    mutating func setSecondaryValue(_ secondaryValue: Any?) {
        self.secondaryValue = secondaryValue
    }
}
