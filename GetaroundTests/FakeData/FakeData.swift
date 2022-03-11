//
//  FakeData.swift
//  GetaroundTests
//
//  Created by Birkyboy on 10/03/2022.
//

import Foundation
@testable import Getaround

class FakeData {

    static let carIncorrectData = "incorrectData".data(using: .utf8)!

    static var carCorrectData: Data? {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "FakeCarData", withExtension: "json")!
        return try? Data(contentsOf: url)
    }

    class NetworkError: Error {}
    static let error = NetworkError()
}
