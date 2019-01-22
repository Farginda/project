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
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.contentView.isUserInteractionEnabled = false

        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
