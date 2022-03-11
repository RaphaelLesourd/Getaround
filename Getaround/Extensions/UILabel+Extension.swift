//
//  UILabel+Extension.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

extension UILabel {
    func setSpannedfont (fullText: String , changeText: String, fontSize: CGFloat) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.font,
                               value: UIFont.systemFont(ofSize: fontSize, weight: .light),
                               range: range)
        self.attributedText = attribute
    }
}
