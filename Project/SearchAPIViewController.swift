//
//  SearchAPIViewController.swift
//  Project
//
//  Created by Farginda on 1/23/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class SearchAPIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblSearch: UITableView!
    
    var isSearch = false
    var arrFilter = [String]()
    var food = [Common]()
    var item: Common!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: food)
        FoodAPIHelper.shared.getFood()
            { (Common) in
                if let Common = Common {
                    self.updateUI(with: Common)
                }
        }
        self.tblSearch.dataSource = self
        self.tblSearch.delegate = self
        self.searchBar.delegate = self
    }
    
    func updateUI(with food: [Common]) {
        DispatchQueue.main.async {
            self.food = food
            self.tblSearch.reloadData()
        }
    }
    var arrCountry = ["Ei", "Banaan", "Tomaat", "Chocolade", "Brood"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearch) {
            return arrFilter.count
        }
        return food.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        if(isSearch){
            cell.textLabel?.text = arrFilter[indexPath.row]
        } else {
            let item = food[indexPath.row]
            cell.textLabel?.text = item.foodName
//            cell.textLabel?.text = item?[indexPath.row]
        }
        return cell
    }
    
    
    // configure view cell menu item
//    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
//        let item = food[indexPath.row]
//        cell.textLabel?.text = item.foodName
//        cell.setNeedsLayout()
//    }

//    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell" as UITableViewCell;
//        configureCell(cell: cell, forRowAtIndexPath: indexPath as NSIndexPath)
//        return cell
//    }
//
//    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
//        if(isSearch){
//            cell.textLabel?.text = arrFilter[IndexPath.row]
//        } else {
//            cell.textLabel?.text = arrCountry[IndexPath.row];
//        }
//    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count == 0 {
            isSearch = false;
            self.tblSearch.reloadData()
        } else {
            arrFilter = food.filter({ (text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            if(arrFilter.count == 0){
                isSearch = false;
            } else {
                isSearch = true;
            }
            self.tblSearch.reloadData()
        }
    }

    // prepare for next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let foodDetailViewController = segue.destination as! FoodDetailViewController
            let index = tblSearch.indexPathForSelectedRow!.row
            foodDetailViewController.item = food[index]
        }
    }
}
