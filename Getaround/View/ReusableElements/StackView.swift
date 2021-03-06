//
//  StackView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class StackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(axis:  NSLayoutConstraint.Axis,
                     distribution:  UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     spacing: CGFloat) {
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
