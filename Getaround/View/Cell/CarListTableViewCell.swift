//
//  CarListTableViewCell.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit
import Kingfisher

class CarListTableViewCell: UITableViewCell {

    static let identifier = "cell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CarListTableViewCell.identifier)
        self.selectionStyle = .none
        setupView()
        setCarImageViewContraints()
        setCarInfoStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
    }

    // MARK: Subviews
    private let carImageView = ImageView(defaultImageName: "CellEmptyStateImage")
    private let carDetailView = CarInfoView()
    private let carRatingView = RatingView()
    private let mainStackView = StackView(axis: .vertical, spacing: 10)

    // MARK: Setup
    func configure(with car: Car) {
        if let imageUrl = URL(string: car.pictureUrl) {
            carImageView.configure(with: imageUrl)
        }
        carDetailView.configure(with: car)
        carRatingView.configure(with: car.rating.average, reviewCount: car.rating.count)
    }

    private func setupView() {
        contentView.backgroundColor = .secondarySystemBackground
        mainStackView.addArrangedSubview(carDetailView)
        mainStackView.addArrangedSubview(carRatingView)
    }

}
// MARK: Constraints
extension CarListTableViewCell {

    private func setCarImageViewContraints() {
        contentView.addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5)
        ])
    }

    private func setCarInfoStackViewConstraints() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
