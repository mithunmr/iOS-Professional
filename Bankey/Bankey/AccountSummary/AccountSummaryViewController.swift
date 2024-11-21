//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Mithun M R on 21/11/24.
//

import UIKit
final class AccountSummaryViewController: UIViewController {
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupView()
    }

}

extension AccountSummaryViewController {
    private  func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

    }

    private func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)

        ])
    }

    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        setupTableHeaderView()
    }


    private func setupTableHeaderView() {
        let headerView = AccountSummaryHeaderView(frame: .zero)
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size

        tableView.tableHeaderView = headerView
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        return cell
    }




}

extension AccountSummaryViewController: UITableViewDelegate {

}



