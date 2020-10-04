//
//  playListTableViewController.swift
//  playerList
//
//  Created by HJ on 2020/10/04.
//

import UIKit



class playListTableViewController: UITableViewController {

    let data:[String] = ["apple", "banana", "grapes"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        // Configure the cell...
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            guard let cell = sender as? UITableViewCell else { return }
            if let index = tableView.indexPath(for: cell){
                vc.data = data[index.row]
            }
        }
    }
}
