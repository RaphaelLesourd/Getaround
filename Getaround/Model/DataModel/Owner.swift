//
//  Owner.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

struct Owner: Decodable, Hashable {
    let name: String
    let pictureUrl: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case name
        case pictureUrl = "picture_url"
        case rating
    }
}
