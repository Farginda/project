//
//  FoodModelV2.swift
//  Project
//
//  Created by Farginda on 1/21/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import Foundation

// struct model to decode JSON data from API
struct Food: Codable {
    var common: [Common]
}

// struct model to decode JSON data from API
struct Common: Codable {
    var foodName, servingUnit: String
    var servingQty: Float
    var commonType: Int?
    var tagID: String
    var photo: CommonPhoto
    
    enum CodingKeys: String, CodingKey {
        case foodName = "food_name"
        case servingUnit = "serving_unit"
        case servingQty = "serving_qty"
        case commonType = "common_type"
        case tagID = "tag_id"
        case photo
    }
}

// struct model to decode JSON data from API
struct CommonPhoto: Codable {
    var thumb: URL
    var isUserUploaded: Bool?
    
    enum CodingKeys: String, CodingKey {
        case thumb
        case isUserUploaded = "is_user_uploaded"
    }
}

// MARK: Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
