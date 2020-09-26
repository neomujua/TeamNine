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
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var teamSpaceTextField: UITextField!
    
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    
    @IBAction func buttonClicked(_ sender: Any) {
        //let values: [String: Any] = [ "name": "hyunho", "age": 31, "married": false]
        let values: [String: Any] = [ "place": placeTextField.text, "teamSpace": teamSpaceTextField.text, "owner": "hyunho"]
        let userItemRef = self.teamItemsReference.child(placeTextField.text ?? "empty")
        userItemRef.setValue(values)
        
        teamItemsReference.observe(.value, with: {
            snapshot in
            print(snapshot)
        })
        
//        teamItemsReference.child("user").observe(.value) {
//            snapshot in
//            let value = snapshot.value as! [String: AnyObject]
//            let name = value["name"] as! String
//
//            print("name is \(name)")
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
