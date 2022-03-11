//
//  ViewControllerMaker.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit

class ViewControllerMaker {
    private let carService = CarService(session: .shared)
    private lazy var carListPresenter = CarListPresenter(apiService: carService)
    private let carDataSource = CarListDataSource()
}

extension ViewControllerMaker: Factory {
    func makeCarListViewController() -> UIViewController {
        return CarListViewController(presenter: carListPresenter,
                                     carDataSource: carDataSource)
    }
}
