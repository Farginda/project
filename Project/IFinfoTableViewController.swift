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
    
    var list = ["https://www.healthline.com/nutrition/10-health-benefits-of-intermittent-fasting", "http://time.com/5354498/is-intermittent-fasting-healthy/", "https://www.health.harvard.edu/blog/intermittent-fasting-surprising-update-2018062914156", "https://www.mindbodygreen.com/articles/why-intermittent-fasting-is-the-best-thing-to-ever-happen-to-your-metabolism", "https://www.dietdoctor.com/intermittent-fasting"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.contentView.isUserInteractionEnabled = false

        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let url : NSURL?
        
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                url = NSURL(string: "http://section0.row0.com")
            case 1:
                url = NSURL(string: "http://section0.row1.com")
            default:
                return;
            }
            
        case 1:
            switch indexPath.row{
            case 0:
                url = NSURL(string: "http://section1.row0.com")
            case 1:
                url = NSURL(string: "http://section1.row1.com")
            default:
                return;
            }
        default:
            return;
        }
        
        if url != nil{
            UIApplication.shared.openURL(url! as URL)
        }
    }

}
