//
//  CarListPresenterTestCase.swift
//  GetaroundTests
//
//  Created by Birkyboy on 11/03/2022.
//

import XCTest
@testable import Getaround

class CarListPresenterTestCase: XCTestCase {

    private var sut: CarListPresenter!
    private var apiService: ApiService!
    private var apiServiceWithError: ApiService!
    private var carListPresenterViewSpy: CarListPresenterViewSpy!

    override func setUp() {
        super.setUp()
        apiService = CarServiceMock(withError: false)
        apiServiceWithError = CarServiceMock(withError: true)
        carListPresenterViewSpy = CarListPresenterViewSpy()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        apiService = nil
        apiServiceWithError = nil
        carListPresenterViewSpy = nil
    }

    func test_whenRetrievingCarList_thenNoError() {
        sut = CarListPresenter(apiService: apiService)
        sut.view = carListPresenterViewSpy
        sut.fetchAvailableCars()
        XCTAssertTrue(carListPresenterViewSpy.showActivityWasCalled)
        XCTAssertTrue(carListPresenterViewSpy.stopActivityWasCalled)
        XCTAssertTrue(carListPresenterViewSpy.applySnapshotWasCalled)
    }

    func test_whenRetrievingCarList_thenError() {
        sut = CarListPresenter(apiService: apiServiceWithError)
        sut.view = carListPresenterViewSpy
        sut.fetchAvailableCars()
        XCTAssertTrue(carListPresenterViewSpy.showActivityWasCalled)
        XCTAssertTrue(carListPresenterViewSpy.stopActivityWasCalled)
        XCTAssertTrue(carListPresenterViewSpy.presentAlertWasCalled)
    }
}
