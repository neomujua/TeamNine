//
//  TeamListTableViewController.swift
//  TeamNine
//
//  Created by 이현호 on 2020/09/15.
//  Copyright © 2020 이현호. All rights reserved.
//

import UIKit
import Firebase

class TeamListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sportFilter: UIBarButtonItem!
    var countOfchildren: Int = 0
    var teamItems: [TeamItem] = []
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    override func viewDidLoad() {
        super.viewDidLoad()
        sportFilter.title = "종목"
        view.backgroundColor = .systemBlue
        tableView.register(UINib(nibName: "TeamListCell", bundle: nil), forCellReuseIdentifier: "TeamListCell")
        tableView.backgroundColor = .systemPink
        tableView.delegate = self
        tableView.dataSource = self
        teamItemsReference.observeSingleEvent(of: .value, with: { (snapshot) in
            self.countOfchildren = Int(snapshot.childrenCount)
            self.tableView.reloadData()
        }
        ) { (error) in print(error.localizedDescription) }
        // Do any additional setup after loading the view.
        teamItemsReference.observe(.value, with: { snapshot in
            var newItems: [TeamItem] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let teamItem = TeamItem(snapshot: snapshot) {
                    newItems.append(teamItem)
                }
            }
            self.teamItems = newItems
            self.tableView.reloadData()
        })
        
    }
    @IBAction func touchSportFilterButton(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TeamListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countOfchildren
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamListCell", for: indexPath) as? TeamListCell
        cell?.gameTitle?.text = teamItems[indexPath.row].title
        cell?.gameTime?.text = teamItems[indexPath.row].gameStartTime
        if teamItems[indexPath.row].teamSpace == 0 {
            cell?.enrollButton.backgroundColor = UIColor.red
            cell?.enrollButton.setTitle("신청 불가", for: .normal)
        } else {
            cell?.enrollButton.backgroundColor = UIColor.blue
            cell?.enrollButton.setTitle("신청 가능", for: .normal)
        }
        print(indexPath.row)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "teamListDetail") {
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
    }
}
