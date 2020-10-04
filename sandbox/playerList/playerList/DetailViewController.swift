//
//  DetailViewController.swift
//  playerList
//
//  Created by 이현호 on 2020/10/04.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        dataLabel.text = data
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
