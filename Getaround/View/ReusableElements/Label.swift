//
//  Label.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(color: UIColor = .label,
                     maxLines: Int = 1,
                     alignment: NSTextAlignment = .left,
                     font: UIFont) {
        self.init(frame: .zero)
        commonInit(color: color, maxLines: maxLines, alignment: alignment, font: font)
    }

    private func commonInit(color: UIColor = .label,
                            maxLines: Int = 1,
                            alignment: NSTextAlignment = .left,
                            font: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)) {
        self.textColor = color
        self.numberOfLines = maxLines
        self.textAlignment = alignment
        self.text = " "
        self.font = font
        self.adjustsFontSizeToFitWidth = true
    }
}
