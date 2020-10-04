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
    
    mutating func setItems(_ items: [TableItemPresentable]) {
        self.items = items
    }
}

protocol TableItemPresentable {
    var cellIdentifier: Constant.CellIdentifier { get }
    var title: NSAttributedString { get }
    var subtitle: String? { get }
    
    var action: Any? { get }
    var value: Any? { get }
    var secondaryValue: Any? { get }
    var isOn: Bool { get }
    var subItems: [TableItemPresentable]? { get }
}

protocol TableItemPresenter {
    var cellIdentifier: Constant.CellIdentifier { get set }
    var action: EmptyAction? { get }
    func setDisplayItem(item: TableItemPresentable)
}

struct PlainItem: TableItemPresentable {
    var isOn: Bool = false
    
    var subItems: [TableItemPresentable]?
    
    var title: NSAttributedString
    var subtitle: String?
    var value: Any?
    var secondaryValue: Any?
    var cellIdentifier: Constant.CellIdentifier
    var action: Any?
    var imageName: String?
    
    init(title: NSAttributedString, imageName: String? = nil , cellIdentifier: Constant.CellIdentifier,  action: Any? = nil) {
        self.title = title
        self.cellIdentifier = cellIdentifier
        self.secondaryValue = imageName
        self.action = action
    }
    
    mutating func setIsOn(_ isOn: Bool) {
        self.isOn = isOn
    }
    
    mutating func setSecondaryValue(_ secondaryValue: Any?) {
        self.secondaryValue = secondaryValue
    }
}
