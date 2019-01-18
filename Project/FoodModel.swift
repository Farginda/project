//
//  FoodModel.swift
//  ProjectUITests
//
//  Created by Farginda on 1/16/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation

// food struct
struct Food: Codable {
    var index: String
    var type: String
    var id: String
    var score: Int
    
    struct Fields {
        var itemID: String
        var itemName: String
        var brandID: String
        var brandName: String
        var calories: Double
        var servingQuantity: Int
        var servingUnit: String
    }
    enum CodingKeys: String, CodingKey {
        case index = "_index"
        case type = "_type"
        case id = "_id"
        case score
        case itemID = "item_id"
        case itemName = "item_name"
        case brandID = "brand_id"
        case brandName = "brand_name"
        case calories = "nf_calories"
        case servingQuantity = "nf_serving_size_qty"
        case servingUnit = "nf_serving_size_unit"
    }
}

struct FoodList: Codable {
    let hits: [Food]
    let fields: [Fields]
}





