//
//  OwnerView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class OwnerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setMainStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let titleLabel = Label()
    private let ownerNameLabel = Label(font: UIFont.systemFont(ofSize: 18, weight: .medium))
    private let ownerRatingView = RatingView()
    private let ownerImageView = ImageView(frame: .zero)

    private let ownerRatingStackView = StackView(axis: .vertical,
                                                 spacing: 5)
    private let ownerDetailsStackView = StackView(axis: .horizontal,
                                                  alignment: .center,
                                                  spacing: 10)
    private let mainStackView = StackView(axis: .vertical,
                                          spacing: 20)

    // MARK: Setup
    func configure(with car: Car) {
        ownerNameLabel.text = car.owner.name.capitalized
        ownerRatingView.configure(with: car.owner.rating.average,
                                  reviewCount: nil)
        if let ownerImageUrl = URL(string: car.owner.pictureUrl) {
            ownerImageView.configure(with: ownerImageUrl)
        }
    }

    private func setupView() {
        self.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.05)
        self.layer.cornerRadius = 17
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.systemPurple.cgColor
        self.layer.borderWidth = 1

        titleLabel.text = "Owner"

        ownerImageView.layer.cornerRadius = 30
        ownerImageView.layer.masksToBounds = true

        ownerRatingStackView.addArrangedSubview(ownerNameLabel)
        ownerRatingStackView.addArrangedSubview(ownerRatingView)

        ownerDetailsStackView.addArrangedSubview(ownerImageView)
        ownerDetailsStackView.addArrangedSubview(ownerRatingStackView)

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(ownerDetailsStackView)
    }
}
// MARK: Constraints
extension OwnerView {
    private func setMainStackViewConstraints() {
        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            ownerImageView.heightAnchor.constraint(equalToConstant: 60),
            ownerImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
