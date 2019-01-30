//
//  IFinfoTableViewController.swift
//  Project
//
//  Created by Farginda on 1/11/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class IFinfoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // list of links
    var list = ["https://www.healthline.com/nutrition/10-health-benefits-of-intermittent-fasting", "http://time.com/5354498/is-intermittent-fasting-healthy/", "https://www.health.harvard.edu/blog/intermittent-fasting-surprising-update-2018062914156", "https://www.mindbodygreen.com/articles/why-intermittent-fasting-is-the-best-thing-to-ever-happen-to-your-metabolism", "https://www.dietdoctor.com/intermittent-fasting"]

    // list of names
    var nameList = ["HealthLine", "Times", "Harvard", "MindBodyGreen", "DietDoctor"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.contentView.isUserInteractionEnabled = false
        cell.textLabel?.text = nameList[indexPath.row]
        return cell
    }
    
    // function for opening hyperlinks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let website = list[indexPath.row]
        if let url = NSURL(string: website) {
            UIApplication.shared.openURL(url as URL)
        }
    }
}
