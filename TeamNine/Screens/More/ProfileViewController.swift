//
//  ProfileUIViewController.swift
//  TeamNine
//
//  Created by 이현호 on 2020/10/03.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sections: [TableSectionPresentable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(cellIdentifier: .profileListCell)
        tableView.delegate = self
        tableView.dataSource = self
        sections = [PlainSection(title: "",
                                 items: [PlainItem(title: "이름", subtitle: "김민수", cellIdentifier: .profileListCell),
                                         PlainItem(title: "이메일", subtitle: "minsu@naver.com", cellIdentifier: .profileListCell),
                                         PlainItem(title: "지역", subtitle: "서울", cellIdentifier: .profileListCell),
                                         PlainItem(title: "관심 종목", subtitle: "농구", cellIdentifier: .profileListCell),
                                         PlainItem(title: "유저 레벨", subtitle: "level1", cellIdentifier: .profileListCell)
                                 ])]
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
