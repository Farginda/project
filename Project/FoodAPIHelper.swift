//
//  FoodAPIHelper.swift
//  Project
//
//  Created by Farginda on 1/15/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation
import UIKit

class FoodAPIHelper {
    static let shared = FoodAPIHelper()
    var score = [Score]()
    
    // GET request FOODAPI
    func getFood(completion: @escaping ([Common]?) -> Void) {
//        let string = "https://api.nutritionix.com/v1_1/search" //VERSIE 1
//        let string = "https://trackapi.nutritionix.com/v2/search/instant?query=chocolate" //TEST SEARCH QUERY
        
        let string = "https://trackapi.nutritionix.com/v2/search/instant?query=\(SearchAPIViewController.searchBar)" //VERSIE 2
        let url = NSURL(string: string)
        let request = NSMutableURLRequest(url: url! as URL)
        request.setValue("01f36468", forHTTPHeaderField: "x-app-id")
        request.setValue("ca614ada16fcf14952f6b85ea19cc298", forHTTPHeaderField: "x-app-key")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            do {
                if let data = data {
                    let food = try? JSONDecoder().decode([Common].self, from: data)
                    completion(food)
                    print(data)
                    print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
                } else {
                    completion(nil)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    // get scores
    func getScores(completion: @escaping ([Score]?) -> Void) {
        let url = URL(string: "https://ide50-farginda.legacy.cs50.io:8080/list")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let score = try JSONDecoder().decode([Score].self, from: data)
                    completion(score)
                } else {
                    completion(nil)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}
