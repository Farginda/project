//
//  FoodAPIViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class FoodAPIViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var food = [Food]()
    var searchFood = [String]()
    var searching = false
    var sort: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodAPIHelper.shared.getFood()
        { (Food) in
            if let Food = Food {
                self.updateUI(with: Food)
            }
        }
    }
    
    func updateUI(with food: [Food]) {
        DispatchQueue.main.async {
            self.food = food
            self.tableView.reloadData()
        }
    }

    var list = ["Ei", "Banaan", "Tomaat", "Chocolade", "Brood"]

}

// tableview for foodlist
extension FoodAPIViewController: UITableViewDataSource, UITabBarDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchFood[indexPath.row]
        } else {
            cell?.textLabel?.text = list[indexPath.row]
        }
        return cell!
    }
}

// implement searchbar
extension FoodAPIViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFood = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
        
    }
    
    // if cancel button is clicked in searchbar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}



