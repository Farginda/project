//
//  FoodModelV2.swift
//  Project
//
//  Created by Farginda on 1/21/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation

struct Food: Codable {
    var common: [Common]
//    let branded: [Branded]
}

//struct Branded: Codable {
//    let foodName, servingUnit, nixBrandID, brandNameItemName: String
//    let servingQty: Double
//    let nfCalories: Int
//    let photo: BrandedPhoto
//    let brandName: String
//    let region, brandType: Int
//    let nixItemID: String
//    let locale: Locale
//
//    enum CodingKeys: String, CodingKey {
//        case foodName = "food_name"
//        case servingUnit = "serving_unit"
//        case nixBrandID = "nix_brand_id"
//        case brandNameItemName = "brand_name_item_name"
//        case servingQty = "serving_qty"
//        case nfCalories = "nf_calories"
//        case photo
//        case brandName = "brand_name"
//        case region
//        case brandType = "brand_type"
//        case nixItemID = "nix_item_id"
//        case locale
//    }
//}

//enum Locale: String, Codable {
//    case enUS = "en_US"
//}
//
//struct BrandedPhoto: Codable {
//    let thumb: String
//}

struct Common: Codable {
    var foodName, servingUnit: String
    var servingQty: Float
    var commonType: Int?
    var tagID: String
    var photo: CommonPhoto
//    var locale: Locale
    
    enum CodingKeys: String, CodingKey {
        case foodName = "food_name"
        case servingUnit = "serving_unit"
        case servingQty = "serving_qty"
        case commonType = "common_type"
        case tagID = "tag_id"
        case photo
    }
}

struct CommonPhoto: Codable {
    var thumb: String
    var highres: JSONNull?
    var isUserUploaded: Bool?
    
    enum CodingKeys: String, CodingKey {
        case thumb, highres
        case isUserUploaded = "is_user_uploaded"
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
