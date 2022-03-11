//
//  ViewController.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit

class CarListViewController: UITableViewController {

    typealias DataSource = UITableViewDiffableDataSource<CarListSection, Car>

    private let activityIndicator = UIActivityIndicatorView()
    private let refresherControl = UIRefreshControl()
    private let emptyStateView = EmptyStateView(message: "No available cars found, yet!\nPull to refresh")
    private lazy var dataSource = carDataSource.makeDataSource(for: tableView)

    private let presenter: CarListPresenter
    private let carDataSource: CarListDataSource

    // MARK: Initializer
    init(presenter: CarListPresenter,
         carDataSource: CarListDataSource) {
        self.presenter = presenter
        self.carDataSource = carDataSource
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Getaround"
        presenter.view = self
        configureTableView()
        addNavigationBarButton()
        addRefresherControlTarget()
        addEmptyStateView()
        applySnapshot(animatingDifferences: false)
        fetchAvailableCars()
    }

    // MARK: Setup
    private func configureTableView() {
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: CarListTableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
        tableView.allowsMultipleSelection = false
        tableView.showsVerticalScrollIndicator = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.alwaysBounceVertical = true
        tableView.separatorStyle = .none
        tableView.refreshControl = refresherControl
        tableView.dataSource = dataSource
    }

    private func addEmptyStateView() {
        tableView.addSubview(emptyStateView)
        emptyStateView.isHidden = true
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 150).isActive = true
        emptyStateView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
    }

    private func addNavigationBarButton() {
        let activityIndicactorButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItems = [activityIndicactorButton]
    }

    private func addRefresherControlTarget() {
        refresherControl.addTarget(self, action: #selector(fetchAvailableCars), for: .valueChanged)
    }

    // MARK: Api Call
    @objc private func fetchAvailableCars() {
        presenter.fetchAvailableCars()
    }

    // MARK: TableView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: CarlistPresenter view
extension CarListViewController: CarListPresenterView {

    func applySnapshot(animatingDifferences: Bool) {
        DispatchQueue.main.async {
            self.emptyStateView.isHidden = !self.presenter.availableCars.isEmpty
            var snapshot = NSDiffableDataSourceSnapshot<CarListSection, Car>()
            snapshot.appendSections([.main])
            snapshot.appendItems(self.presenter.availableCars, toSection: .main)
            self.dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
        }
    }

    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }

    func stopActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.perform(#selector(UIActivityIndicatorView.stopAnimating),
                                           with: nil,
                                           afterDelay: 0.3)
            self.refresherControl.perform(#selector(UIRefreshControl.endRefreshing),
                                                   with: nil,
                                                   afterDelay: 0.1)
        }
    }

    func presentAlert(with message: String) {
        Alert.show(with: message, on: self)
    }
}
