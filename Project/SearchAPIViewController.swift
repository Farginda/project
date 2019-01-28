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
    var food: [Common]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        FoodAPIHelper.shared.getFood(searchTerm: "")
        { (results, food)  in
            if let results = results {
                print("RESULTSLIST \(results)")
                self.food = results
            }
            
            self.updateUI(with: self.food)

        self.tblSearch.dataSource = self
        self.tblSearch.delegate = self
        self.searchBar.delegate = self
        }
    }
    
    
    func updateUI(with food: [Common]) {
        DispatchQueue.main.async {
            
            print("This is your list: \(food)")
            self.food = food
            self.tblSearch.reloadData()
        }
    }
    
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
        let getFood = food[indexPath.row]
        if(isSearch){
            cell.textLabel?.text = getFood.foodName
        } else {
            cell.textLabel?.text = getFood.foodName
        }
        return cell
    }

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
        isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count == 0 {
            isSearch = false;
            self.tblSearch.reloadData()
        } else {
            guard let searchText = searchBar.text, !searchText.isEmpty else { return }
            print("Hallo")
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            FoodAPIHelper.shared.getFood(searchTerm: searchText) { results, errorMessage in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let results = results {
                    print("RESULTSLIST \(results)")
                    self.food = results
                    self.tblSearch.reloadData()
                    self.tblSearch.setContentOffset(CGPoint.zero, animated: false)
                }
                if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
            }
//            let getFood = food
//            arrFilter = food.filter({ (text) -> Bool in
//                let tmp: NSString = text as NSString
//                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//                return range.location != NSNotFound
//            })
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
