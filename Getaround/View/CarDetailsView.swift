//
//  CarDetailsView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

protocol CarDetailsViewDelegate: AnyObject {
    func dismissCarDetailsController()
}

class CarDetailsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setScrollViewConstraints()
        setCarImageViewConstraints()
        setStackViewConstraints()
        setCloseControllerButtonContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    weak var delegate: CarDetailsViewDelegate?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let closeControllerButton: UIButton = {
        let button = UIButton()
        let image = Images.Button.close
        button.setImage(image, for: .normal)
        button.backgroundColor = .secondaryLabel
        button.tintColor = .systemBackground
        button.layer.cornerRadius = 22
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(closeControllerButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let carImageView = ImageView(defaultImage: Images.Default.carImage)
    private let carInfosView = CarInfoView()
    private let carRatingView = RatingView()
    private let separatorView = SperatorLineView()
    private let ownerView = OwnerView()
    private let stackView = StackView(axis: .vertical,
                                      spacing: 10)

    // MARK: Setup
    func configure(with car: Car) {
        if let carImageUrl = URL(string: car.pictureUrl) {
            carImageView.configure(with: carImageUrl)
        }
        carInfosView.configure(with: car)
        carRatingView.configure(with: car.rating.average,
                                reviewCount: car.rating.count)
        ownerView.configure(with: car)
    }

    private func setupView() {
        stackView.addArrangedSubview(carInfosView)
        stackView.addArrangedSubview(carRatingView)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(ownerView)

        stackView.setCustomSpacing(30, after: carRatingView)
        stackView.setCustomSpacing(50, after: separatorView)
    }

    @objc func closeControllerButtonAction() {
        delegate?.dismissCarDetailsController()
    }
}

extension CarDetailsView {

    private func setScrollViewConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func setCarImageViewConstraints() {
        contentView.addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7)
        ])
    }

    private func setStackViewConstraints() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    private func setCloseControllerButtonContraints() {
        contentView.addSubview(closeControllerButton)
        NSLayoutConstraint.activate([
            closeControllerButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            closeControllerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            closeControllerButton.heightAnchor.constraint(equalToConstant: 44),
            closeControllerButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}
