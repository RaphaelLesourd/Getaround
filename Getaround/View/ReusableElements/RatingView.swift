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
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    private let stackView = StackView(axis: .horizontal, spacing: 10)

    // MARK: Configure
    func configure(with rating: Double, reviewCount: Int) {
        ratingView.updateView(rating: rating)
        reviewCountLabel.text = "\(reviewCount) reviews"
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

            ratingView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
    }
}
