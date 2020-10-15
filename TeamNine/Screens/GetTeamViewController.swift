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
    @IBOutlet weak var placeImageURL: UITextField!
    @IBOutlet weak var recruitmentTitle: UITextField!
    @IBOutlet weak var searchPlace: UISearchBar!
    @IBOutlet weak var matchDate: UITextField!
    @IBOutlet weak var matchTime: UITextField!
    @IBOutlet weak var recruitmentNumber: UITextField!
    @IBOutlet weak var content: UITextView!
    
    let teamItemsReference = Database.database().reference(withPath: "team-items")
    
    @IBAction func buttonClicked(_ sender: Any) {
        //let values: [String: Any] = [ "name": "hyunho", "age": 31, "married": false]
        let values: [String: Any] = [ "owner": "userID",
                                      "image": placeImageURL.text,
                                      "title": recruitmentTitle.text,
                                      "place":
                                        searchPlace.text,
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
    
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
}
