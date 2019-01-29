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
    var filteredList = [String]()
    var food: [Common] = []
    var list: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI(with: self.food)
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


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        let getFood = food[indexPath.row]
        
        if getFood.foodName == "" {
            cell.textLabel?.text = "Did not find food."
        }

        if(isSearch){
            cell.textLabel?.text = getFood.foodName
        } else {
            cell.textLabel?.text = getFood.foodName
        }
        
        return cell
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count == 0 {
            isSearch = false
            self.tblSearch.reloadData()
        } else {
            guard let searchText = searchBar.text, !searchText.isEmpty else { return }
            print("Hallo")
            FoodAPIHelper.shared.getFood(searchTerm: searchText) { results, errorMessage in
                if let results = results {
                    print("RESULTSLIST \(results)!!!!!!!")
                    self.food = results
                }
                if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
            
            
            for item in self.food {
                self.list.append(item.foodName)
            }
            print("\n\n\n\n")
            
            print(self.list)
            
//                self.filteredList = self.list.filter({ (text) -> Bool in
//                let tmp: NSString = text as NSString
//                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//
//                    if(self.filteredList.count == 0){
//                        self.isSearch = false
//                } else {
//                        self.isSearch = true
//                }
                DispatchQueue.main.async {
                    self.tblSearch.reloadData()
                }
                
//                return range.location != NSNotFound
//            })
            }
        }
    }

    // prepare for next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let foodDetailViewController = segue.destination as! FoodDetailViewController
            let index = tblSearch.indexPathForSelectedRow!.row
            foodDetailViewController.item = food[index]
            print(food[index])
        }
    }

}
