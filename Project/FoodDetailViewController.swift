//
//  FoodDetailViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var item: Common!
    var food: [Common] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        titleLabel.text = item.foodName
        }
}
