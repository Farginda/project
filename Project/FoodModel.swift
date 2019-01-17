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
    var name: String
    var id: String

    enum CodingKeys: String, CodingKey {
        case name = "food_name"
        case id = "tag_id"
    }
}

struct FoodList: Codable {
    let common: [Food]
}



