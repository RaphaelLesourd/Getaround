//
//  CarServiceMock.swift
//  GetaroundTests
//
//  Created by Birkyboy on 11/03/2022.
//

import XCTest
@testable import Getaround

class CarServiceMock: ApiService {

    private let withError: Bool

    init(withError: Bool) {
        self.withError = withError
    }

    func getAvailableCars(completion: @escaping (Result<[Car], NetworkError>) -> Void) {
         withError ? completion(.failure(.dataError)) : completion(.success([]))
    }
}
