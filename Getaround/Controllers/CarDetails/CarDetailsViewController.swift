//
//  CarDetailsViewController.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class CarDetailsViewController: UIViewController {

    private let car: Car
    private let carDetailsView = CarDetailsView()

    // MARK: Initilizer
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecylcle
    override func loadView() {
        view = carDetailsView
        view.backgroundColor = .secondarySystemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        carDetailsView.delegate = self
        carDetailsView.configure(with: car)
    }
}
// MARK: CarDetailsView delegate
extension CarDetailsViewController: CarDetailsViewDelegate {
    func dismissCarDetailsController() {
        dismiss(animated: true, completion: nil)
    }
}
