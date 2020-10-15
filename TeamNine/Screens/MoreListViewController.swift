//
//  MoreViewController.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/20.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class MoreListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var sections: [TableSectionPresentable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private func setSection() {
        var newSections: [TableSectionPresentable] = [PlainSection(title: "섹션제목",
                                                                   items: [PlainItem(title: NSAttributedString(string: "프로필"), cellIdentifier: .moreListCell),
                                                                           PlainItem(title: NSAttributedString(string: "오픈소스"), cellIdentifier: .moreListCell),
                                                                           PlainItem(title: NSAttributedString(string: "공유기능"), cellIdentifier: .moreListCell),
                                                                           PlainItem(title: NSAttributedString(string: "설정"), cellIdentifier: .moreListCell)])]
        sections = newSections
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(cellIdentifier: .moreListCell)
        setSection()
    }
}



extension MoreListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: TableItemPresentable = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier.rawValue,
                                                 for: indexPath)
        
        if let displayCell = cell as? TableItemPresenter {
            displayCell.setDisplayItem(item: item)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: TableItemPresentable = sections[indexPath.section].items[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
