//
//  FinishedViewController.swift
//  Project
//
//  Created by Farginda on 1/9/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    var seconds: Double!
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var shareCompareButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func SCButtonPressed(_ sender: UIButton) {
        let url = URL(string: "https://ide50-farginda.cs50.io:8080/list")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "name=\(nameTextField.text!)&score=\(seconds)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            self.viewScores() VIEWSCORES
        }
        task.resume()
        
    }
    
//    func viewScores() {
//        FoodHelper.shared.getFood() { (highscores) in
//            if let highscores = highscores {
//                self.highscores = highscores
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

