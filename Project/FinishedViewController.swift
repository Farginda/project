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
    var score = [Score]()
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var shareCompareButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareCompareButton.layer.cornerRadius = 10
        shareCompareButton.clipsToBounds = true
        let hours = seconds / 3600
        congratsLabel.text = "Congratulations! You've finished your intermittent fasting with a total of \(hours.rounded()) hours!"
    }
    
    // request for updating scores database
    @IBAction func SCButtonPressed(_ sender: UIButton) {
        let url = URL(string: "https://ide50-farginda.legacy.cs50.io:8080/list")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let hours = seconds / 3600
        let postString = "name=\(nameTextField.text!)&score=\(hours.rounded())"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "CompareSegue", sender: nil)
            }
            self.viewScores()
        }
        task.resume()
       
    }

    // shows scores
    func viewScores() {
        FoodAPIHelper.shared.getScores() { (score) in
            if let score = score {
                self.score = score
                }
            }
        }
    
    // prepare for next segue by passing on seconds
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompareSegue" {
            let compareTableViewController = segue.destination as! CompareTableViewController
            compareTableViewController.seconds = seconds.rounded()
        }
    }

    
}

