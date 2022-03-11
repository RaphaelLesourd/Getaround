//
//  CarDetailView.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit

class CarInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        carInfoStackView.addArrangedSubview(carLabel)
        carInfoStackView.addArrangedSubview(rentalPriceLabel)
        setCarInfoStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let carLabel = Label(maxLines: 1,
                                 font: UIFont.systemFont(ofSize: 21, weight: .semibold))

    private let rentalPriceLabel = Label(color: .systemPurple,
                                         alignment: .right,
                                         font: UIFont.systemFont(ofSize: 21, weight: .bold))

    private let carInfoStackView = StackView(axis: .horizontal,
                                             alignment: .top,
                                             spacing: 10)

    // MARK: Configure
    func configure(with car: Car) {
        carLabel.text = "\(car.brand) \(car.model)"

        let rentalRangeLength = "/day"
        let pricePerDay = car.pricePerDay.convertToCurrency()
        rentalPriceLabel.setSpannedfont(fullText: "\(pricePerDay)\(rentalRangeLength)",
                                        changeText:  rentalRangeLength,
                                        fontSize: 16)
    }
}
// MARK: Constraints
extension CarInfoView {

    private func setCarInfoStackViewConstraints() {
        addSubview(carInfoStackView)
        NSLayoutConstraint.activate([
            carInfoStackView.topAnchor.constraint(equalTo: topAnchor),
            carInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
