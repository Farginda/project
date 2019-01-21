//
//  FinishedViewController.swift
//  Project
//
//  Created by Farginda on 1/9/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    var seconds: Double = 0.00
    var score = [Score]()
    
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
            self.viewHighScores()
        }
        task.resume()
        
    }
    
    // shows highscores
    func viewHighScores() {
        FoodAPIHelper.shared.getScores() { (score) in
            if let score = score {
                self.score = score
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congratsLabel.text = "Congratulations! You've finished your intermittent fasting with a total of \(seconds) hours!"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompareSegue" {
            let compareTableViewController = segue.destination as! CompareTableViewController
            compareTableViewController.seconds = seconds
        }
    }

    
}

