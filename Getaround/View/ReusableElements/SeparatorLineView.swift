//
//  SeparatorLineView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class SperatorLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.3)
        self.translatesAutoresizingMaskIntoConstraints = false
        setLineHeight()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(thickness: CGFloat = 1) {
        self.init(frame: .zero)
        setLineHeight(thickness)
    }

    private func setLineHeight(_ height: CGFloat = 1) {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
