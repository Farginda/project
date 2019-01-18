//
//  ScoreModel.swift
//  Project
//
//  Created by Farginda on 1/17/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation

struct Score: Codable {
    var name: String
    var score: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case score
    }
}
