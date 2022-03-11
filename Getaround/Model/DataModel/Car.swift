//
//  Car.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

struct Car: Decodable, Hashable {
    let brand, model: String
    let pictureUrl: String
    let pricePerDay: Int
    let rating: Rating
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case brand, model
        case pictureUrl = "picture_url"
        case pricePerDay = "price_per_day"
        case rating, owner
    }
}
