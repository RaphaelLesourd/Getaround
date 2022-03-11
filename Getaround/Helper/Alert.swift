//
//  Alerts.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import UIKit

class Alert {
    static func show(with message: String,
                     on controller: UIViewController) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Oops!",
                                          message: message,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil)
            alert.addAction(action)
            controller.present(alert, animated: true)
        }
    }
}
