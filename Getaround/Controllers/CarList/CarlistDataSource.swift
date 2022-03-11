//
//  CarlistDataSource.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import Foundation
import UIKit

class CarListDataSource: NSObject {

    typealias DataSource = UITableViewDiffableDataSource<CarListSection, Car>

    func makeDataSource(for tableView: UITableView) -> DataSource {
        let dataSource = DataSource(tableView: tableView) { tableView, _, itemIdentifier in
            let identifier = CarListTableViewCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CarListTableViewCell
            cell?.configure(with: itemIdentifier)
            return cell
        }
        return dataSource
    }
}
