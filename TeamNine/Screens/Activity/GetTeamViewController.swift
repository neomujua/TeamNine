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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var makeTeamButton: UIButton!
    private var imageURLCell: PlainCell = PlainCell(title: "test", cellIdentifier: .getTeamInputCell)
    
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    
    private var sections: [TableSectionPresentable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        tableView.reloadData()
        
        
        //let values: [String: Any] = [ "name": "hyunho", "age": 31, "married": false]
        let values: [String: Any] = [ "address" : "addressTest",
                                      "contents" : "contentTest",
                                      "gameCategory" : "gameCategoryTest",
                                      "gamePlayTime" : 0,
                                      "gameStartTime" : "11:21",
                                      "imageUrl": "imageURLCell.imageName",
                                      "ownerName": "userID",
                                      "place": "placeTest",
                                      "teamSize": 1,
                                      "teamSpace": 2,
                                      "title": "제목입니다",
                                      ]
        
        let userItemRef = self.teamItemsReference.child("teamNameTest" + String(Int.random(in: 1...1000)) ?? "empty")
        userItemRef.setValue(values)
        showAlert()
        teamItemsReference.observe(.value, with: {
            snapshot in
            print(snapshot)
        })
        
        
    }
    
    // TODO: - 함수로 만들기
    private func showAlert() {
        let alert = UIAlertController(title: "성공!", message: "팀 구하기 업로드를 완료했습니다.", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler : { (action) in
            self.dismissView() })
        let cancel = UIAlertAction(title: "cancel", style: .destructive, handler : nil)
        
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
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
    }
    
    private func setSection() {
        imageURLCell = PlainCell(title: "장소 이미지 URL 입력", cellIdentifier: .getTeamInputCell)
        let newSections: [TableSectionPresentable] = [PlainSection(title: "섹션제목",
                                                                   items: [imageURLCell,
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
