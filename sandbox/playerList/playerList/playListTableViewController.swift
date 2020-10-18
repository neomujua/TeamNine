////
////  playListTableViewController.swift
////  playerList
////
////  Created by HJ on 2020/10/04.
////
//
//import UIKit
//
//
//
//class playListTableViewController: UITableViewController {
//
////    let data:[String] = ["apple", "banana", "grapes"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    struct ddata {
//        var name: String = ""
//        var taste: String = ""
//        var priority: Int = Int()
//    }
//    
//    static func genDdata() -> Array<ddata> {
//        let data:[String] = ["apple", "banana", "grapes"]
//        let Ddata = [
//            ddata(name: data[0], taste: "Sweet"),
//            ddata(name: data[1], taste: "Awesome"),
//            ddata(name: data[2], taste: "Good")
//        ]
//        return Ddata
//    }
//    
//    let Data = genDdata()
//    
//
//    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return Data.count
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
//        cell.textLabel?.text = Data[indexPath.row].name
//        cell.detailTextLabel?.text = Data[indexPath.row].taste
//        // Configure the cell...
//        return cell
//    }
//    
//    
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        if let vc = segue.destination as? DetailViewController {
////            guard let cell = sender as? UITableViewCell else { return }
////            if let index = tableView.indexPath(for: cell){
////                vc.data = data[index.row]
////            }
////        }
////    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as? DetailViewController
//        guard let cell = sender as? UITableViewCell else { return }
//        let index = tableView.indexPath(for: cell)
//        vc?.data = Data[index!.row].name
//        vc?.subData = Data[index!.row].taste
//    }
//}
