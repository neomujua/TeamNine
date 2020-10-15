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
        let newSections: [TableSectionPresentable] = [PlainSection(title: "섹션제목",
                                                                   items: [PlainItem(title: "프로필", imageName: "profile" , cellIdentifier: .moreListCell),
                                                                           PlainItem(title: "오픈소스", cellIdentifier: .moreListCell),
                                                                           PlainItem(title: "앱 공유하기", cellIdentifier: .moreListCell),
                                                                           PlainItem(title: "설정", cellIdentifier: .moreListCell)])]
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
        if item.title ==  "프로필" {
            if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "profileTableView") {
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
        }
        
        if item.title == "오픈소스" {
            if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "openSource") {
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
        }
        
        if item.title == "앱 공유하기" {
            let text = "This is the text....."
            let textShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
        
        if item.title == "설정" {
            if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "settings") {
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
