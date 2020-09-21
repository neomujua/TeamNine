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
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        tableView.register(UINib(nibName: "TeamListCell", bundle: nil), forCellReuseIdentifier: "TeamListCell")
        tableView.backgroundColor = .systemPink
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
    func getNumber() -> Int {
        var number:Int = 0
        teamItemsReference.observeSingleEvent(of: .value, with: { (snapshot) in let value = snapshot.value as? NSDictionary
            
            
            for _ in value! {
                number += 1
            }
            
            print("IN : \(number)")
        }
        ) { (error) in print(error.localizedDescription)}
        print("OUT : \(number)")
        
        return number
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number: Int = getNumber()
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        teamItemsReference.observe(.value, with: {
//            snapshot in
//            print(snapshot)
//        })
        
//        teamItemsReference.child("user").observe(.value) {
//            snapshot in
//            let value = snapshot.value as! [String: AnyObject]
//            let name = value["name"] as! String
//
//            print("name is \(name)")
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamListCell")
        
        if let displayCell = cell as? TeamListCell {
            displayCell.awakeFromNib()
        }

        return cell!
    }
}
