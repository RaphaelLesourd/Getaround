//
//  CarListPresenterSpy.swift
//  GetaroundTests
//
//  Created by Birkyboy on 11/03/2022.
//

import XCTest
@testable import Getaround

class CarListPresenterViewSpy: CarListPresenterView {

    var applySnapshotWasCalled = false
    var showActivityWasCalled = false
    var stopActivityWasCalled = false
    var presentAlertWasCalled = false

    func applySnapshot(animatingDifferences: Bool) {
        applySnapshotWasCalled = true
    }

    func showActivityIndicator() {
        showActivityWasCalled = true
    }

    func stopActivityIndicator() {
        stopActivityWasCalled = true
    }

    func presentAlert(with message: String) {
        presentAlertWasCalled = true
    }
}
