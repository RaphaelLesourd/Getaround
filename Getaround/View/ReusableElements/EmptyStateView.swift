//
//  EmptyStateView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class EmptyStateView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setLabelContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }

    private let messageLabel = Label(color: .white,
                                     maxLines: 5,
                                     alignment: .center,
                                     font: UIFont.systemFont(ofSize: 14, weight: .medium))

    // MARK: Setup
    private func setupView() {
        self.backgroundColor = .systemPurple
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
}
// MARK: Constraints
extension EmptyStateView {
    private func setLabelContraints() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
