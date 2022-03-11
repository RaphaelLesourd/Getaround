//
//  Factory.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit

protocol Factory {
    func makeCarListViewController() -> UIViewController
    func makeCarDetailsViewController(with car: Car) -> UIViewController
}
