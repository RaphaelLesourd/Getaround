//
//  CarListPresenter.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

class CarListPresenter {

    weak var view: CarListPresenterView?
    var availableCars: [Car] = []

    private let apiService: ApiService

    init(apiService: ApiService) {
        self.apiService = apiService
    }

    func fetchAvailableCars() {
        view?.showActivityIndicator()

        apiService.getAvailableCars { [weak self] result in
            self?.view?.stopActivityIndicator()
            switch result {
            case .success(let car):
                self?.availableCars = car
                self?.view?.applySnapshot(animatingDifferences: true)
            case .failure(let error):
                self?.view?.presentAlert(with: error.description)
            }
        }
    }
}
