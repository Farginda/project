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
    var errorMessage = ""
    
    typealias JSONDictionary = [String]
    typealias QueryResult = ([Common]?, String) -> ()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // get food info from online API (Nutritionix Version 2.0)
    func getFood(searchTerm: String, completion: @escaping QueryResult) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://trackapi.nutritionix.com/v2/search/instant?") {
            urlComponents.query = "query=\(searchTerm)"
            guard let url = urlComponents.url else { return }
            
            // request for id and key headers
            let request = NSMutableURLRequest(url: url as URL)
            request.setValue("01f36468", forHTTPHeaderField: "x-app-id")
            request.setValue("ca614ada16fcf14952f6b85ea19cc298", forHTTPHeaderField: "x-app-key")
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            do {
                if let data = data,
                    let _ = response as? HTTPURLResponse
                {
                    let food = try JSONDecoder().decode(Food.self, from: data)
                    completion(food.common, self.errorMessage)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
        
    }

    // get scores from database
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

    // get image from food API
    func getImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
