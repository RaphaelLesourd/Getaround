//
//  CarListPresenterView.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

protocol CarListPresenterView: AnyObject {
    func applySnapshot(animatingDifferences: Bool)
    func presentAlert(with message: String)
    func showActivityIndicator()
    func stopActivityIndicator()
}
