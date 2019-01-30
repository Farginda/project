//
//  CompareTableViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class CompareTableViewController: UITableViewController {

    var seconds: Double!
    var score = [Score]()
    
    override func viewDidLoad() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
        super.viewDidLoad()
        self.viewWillAppear(true)
        viewScores()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return score.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    // show scores
    func viewScores() {
        FoodAPIHelper.shared.getScores() { (score) in
            if let score = score {
                self.score = score
                
                // reload data after fetching scores
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // set cell text
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let user = score[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "\(user.score) uur"
    }
    
    // override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
