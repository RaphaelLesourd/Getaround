//
//  NetworkCallTestCase.swift
//  GetaroundTests
//
//  Created by Birkyboy on 10/03/2022.
//

@testable import Getaround
import XCTest

class NetworkCallTestCase: XCTestCase {

    private var session: URLSession!
    private var sut: ApiService!
    private let url = URL(string: "myDefaultURL")!

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: configuration)
        sut = CarService(session: session)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        session = nil
    }

    func test_whenRetrievingAvailableCars_thenNoErrors() {
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        MockURLProtocol.loadingHandler = { [self] _ in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return HandlerResponse(response: response,
                                   data: FakeData.carCorrectData,
                                   error: nil)
        }

        sut.getAvailableCars { result in
            switch result {
            case .success(let cars):
                XCTAssertNotNil(cars)
                XCTAssertEqual(cars.first?.brand, "Citroen")
                XCTAssertEqual(cars.first?.model, "C3")
                XCTAssertEqual(cars.first?.pricePerDay, 17)
                XCTAssertEqual(cars.first?.rating.average, 4.697711)
                XCTAssertEqual(cars.first?.rating.count, 259)
                XCTAssertEqual(cars.first?.owner.name, "Elmira Sorrell")
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_whenRetrievingAvailableCars_thenDecodingError() {
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        MockURLProtocol.loadingHandler = { [self] _ in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return HandlerResponse(response: response,
                                   data: FakeData.carIncorrectData,
                                   error: NetworkError.decodingData)
        }

        sut.getAvailableCars { result in
            switch result {
            case .success(let cars):
                XCTAssertNil(cars)
            case .failure(let error):
                XCTAssertEqual(error.description, NetworkError.decodingData.description)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_whenRetrievingAvailableCars_thenHttpRequestError() {
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        MockURLProtocol.loadingHandler = { [self] _ in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 500,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return HandlerResponse(response: response,
                                   data: FakeData.carCorrectData,
                                   error: NetworkError.responseError)
        }
        sut.getAvailableCars { result in
            switch result {
            case .success(let cars):
                XCTAssertNil(cars)
            case .failure(let error):
                XCTAssertEqual(error.description, NetworkError.responseError.description)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_whenRetrievingAvailableCars_thenError() {
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        MockURLProtocol.loadingHandler = { [self] _ in
            let response = HTTPURLResponse(url: url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return HandlerResponse(response: response,
                                   data: nil,
                                   error: NetworkError.dataError)
        }
        sut.getAvailableCars { result in
            switch result {
            case .success(let cars):
                XCTAssertNil(cars)
            case .failure(let error):
                XCTAssertEqual(error.description, NetworkError.dataError.description)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
