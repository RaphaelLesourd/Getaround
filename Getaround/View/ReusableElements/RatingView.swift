//
//  CarRatingView.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit

class RatingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        stackView.addArrangedSubview(ratingView)
        stackView.addArrangedSubview(reviewCountLabel)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let ratingView = StarRatingView(starCount: 5, rating: 0)
    private let reviewCountLabel = Label(font: UIFont.systemFont(ofSize: 14, weight: .regular))
    private let stackView = StackView(axis: .horizontal, spacing: 10)

    // MARK: Configure
    func configure(with rating: Double, reviewCount: Int? = nil) {
        ratingView.updateView(rating: rating)
        if let reviewCount = reviewCount {
            reviewCountLabel.text = "\(reviewCount)"
        }
    }
}
// MARK: Constraints
extension RatingView {
    private func setConstraints() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            ratingView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            ratingView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
