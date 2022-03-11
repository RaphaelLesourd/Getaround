//
//  Images.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

enum Images {

    enum Default {
        static let carImage = UIImage(named: "CellEmptyStateImage")!
    }

    enum Button {
        private static let defaultConfiguration = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .medium)
        static let close = UIImage(systemName: "multiply", withConfiguration: Images.Button.defaultConfiguration)
    }
}
