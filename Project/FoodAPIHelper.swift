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
    
//    let kAppId = "01f36468"
//    let kAppKey = "ca614ada16fcf14952f6b85ea19cc298"
//
////    let baseurl = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients")!
//
//    let url = NSURL(string: "https://trackapi.nutritionix.com/v2/search/instant&appId=01f36468&appKey=ca614ada16fcf14952f6b85ea19cc298")!
    
    // GET request FOODAPI
    func getFood(completion: @escaping ([Food]?) -> Void) {
        let string = "https://trackapi.nutritionix.com/v2/search/instant"
        let url = NSURL(string: string)
        let request = NSMutableURLRequest(url: url! as URL)
        request.setValue("01f36468", forHTTPHeaderField: "x-app-id")
        request.setValue("ca614ada16fcf14952f6b85ea19cc298", forHTTPHeaderField: "x-app-key")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let res = response as? HTTPURLResponse {
                print("res: \(String(describing: res))")
                print("Response: \(String(describing: response))")
            } else{
                print("Error: \(String(describing: error))")
            }
        }
        task.resume()
    }

