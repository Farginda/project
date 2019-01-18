//
//  FoodModel.swift
//  ProjectUITests
//
//  Created by Farginda on 1/16/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation

struct Food: Codable {
    let totalHits, maxScore: Int
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
        case maxScore = "max_score"
        case hits
    }
}

struct Hit: Codable {
    let index: String
    let type: TypeEnum
    let id: String
    let score: Int
    let fields: Fields
    
    enum CodingKeys: String, CodingKey {
        case index = "_index"
        case type = "_type"
        case id = "_id"
        case score = "_score"
        case fields
    }
}

struct Fields: Codable {
    let itemID, itemName: String
    let brandName: BrandName
    let nfCalories: Double
    let nfServingSizeQty: Int
    let nfServingSizeUnit: NfServingSizeUnit
    
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case itemName = "item_name"
        case brandName = "brand_name"
        case nfCalories = "nf_calories"
        case nfServingSizeQty = "nf_serving_size_qty"
        case nfServingSizeUnit = "nf_serving_size_unit"
    }
}

enum BrandName: String, Codable {
    case nutritionix = "Nutritionix"
}

enum NfServingSizeUnit: String, Codable {
    case serving = "serving"
}

enum TypeEnum: String, Codable {
    case item = "item"
}



