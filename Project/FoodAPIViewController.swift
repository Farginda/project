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
    
    var foodv2 = [FoodV2]()
    var food = [Common]()
    var searchFood = [String]()
    var searching = false
    var sort: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        FoodAPIHelper.shared.getFood()
        { (Common) in
            if let Common = Common {
                self.updateUI(with: Common)
            }
        }
        searchBar.delegate = self
    }
    
    func updateUI(with food: [Common]) {
        DispatchQueue.main.async {
            self.food = food
            self.tableView.reloadData()
        }
    }

    var list = ["Ei", "Banaan", "Tomaat", "Chocolade", "Brood"]

}

// tableview for foodlist
extension FoodAPIViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        print("cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if searching {
            print("searching")
            cell.textLabel?.text = searchFood[indexPath.row]
        } else {
            print("else")
            cell.textLabel?.text = list[indexPath.row]
//            let foodSearch = foodv2[indexPath.row]
//            let list = foodSearch.common[indexPath.row]
//            cell?.textLabel?.text = list.foodName.prefix(upTo: String.Index)[indexPath.row]
        }
        return cell
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



