//
//  ImageView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit
import Kingfisher

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        self.tintColor = .systemPurple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(defaultImageName: String) {
        self.init(frame: .zero)
        self.image = UIImage(named: defaultImageName)
    }

    func configure(with url: URL) {
        self.kf.setImage(with: url, options: [.cacheOriginalImage])
    }
}
