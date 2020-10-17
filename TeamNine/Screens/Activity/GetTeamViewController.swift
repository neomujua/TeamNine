//
//  GetTeamViewController.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/20.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit
import Firebase

class GetTeamViewController: UIViewController {
//    @IBOutlet weak var placeTextField: UITextField!
//    @IBOutlet weak var teamSpaceTextField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeImageURL: UITextField!
    @IBOutlet weak var recruitmentTitle: UITextField!
    @IBOutlet weak var matchDate: UITextField!
    @IBOutlet weak var matchTime: UITextField!
    @IBOutlet weak var recruitmentNumber: UITextField!
    @IBOutlet weak var content: UITextField!
    
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    
    private var sections: [TableSectionPresentable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        //let values: [String: Any] = [ "name": "hyunho", "age": 31, "married": false]
        let values: [String: Any] = [ "owner": "userID",
                                      "image": placeImageURL.text,
                                      "title": recruitmentTitle.text,
                                      "date": matchDate.text,
                                      "time": matchTime.text,
                                      "recruitmentNumber": recruitmentNumber.text,
                                      "content": content.text]
        let userItemRef = self.teamItemsReference.child(recruitmentTitle.text ?? "empty")
        userItemRef.setValue(values)
        
        teamItemsReference.observe(.value, with: {
            snapshot in
            print(snapshot)
        })
    }
    @IBAction func clickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .purple
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(cellIdentifier: .getTeamInputCell)
        tableView.registerNib(cellIdentifier: .dateTimePicker)
        setSection()
        // Do any additional setup after loading the view.
    }
    
    private func setSection() {
        let newSections: [TableSectionPresentable] = [PlainSection(title: "섹션제목",
                                                                   items: [PlainCell(title: "장소 이미지 URL 입력", cellIdentifier:               .getTeamInputCell),
                                                                           PlainCell(title: "글 제목", cellIdentifier: .getTeamInputCell),
                                                                           PlainCell(title: "추가설명", cellIdentifier: .getTeamInputCell),
                                                                           PlainCell(title: "", cellIdentifier: .dateTimePicker),
                                                                           PlainCell(title: "설정", cellIdentifier: .getTeamInputCell)])]
        sections = newSections
        self.tableView.reloadData()
    }
}

extension GetTeamViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: TableCellPresentable = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier.rawValue,
                                                 for: indexPath)
        
        if let displayCell = cell as? TableItemPresenter {
            displayCell.setDisplayItem(item: item)
        }
        return cell
    }
}
