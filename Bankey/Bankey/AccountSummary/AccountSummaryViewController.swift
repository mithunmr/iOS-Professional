//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Mithun M R on 21/11/24.
//

import UIKit
struct TableData {
    var section: String
    var items: [String]
}

final class AccountSummaryViewController: UIViewController {
    let tableView = UITableView()

    let tableData:[TableData] = [.init(section: "Cat", items: ["cat 1", "cat 2"]),
                                 .init(section: "Dog", items: ["dog 1", "dog 2"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Resize header view with dynamic size in UITableView
        guard let headerView = tableView.tableHeaderView else {
            return
        }
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.height != size.height {
            tableView.tableHeaderView?.frame = CGRect(
                origin: headerView.frame.origin,
                size: size
            )
            tableView.layoutIfNeeded()
        }
    }
}

extension AccountSummaryViewController {
    private  func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = .black

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
        registerCell()
    }


    private func setupTableHeaderView() {
        let headerView = AccountSummaryHeaderView(frame: .zero)
        headerView.setUpView()

        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
    }

    private func registerCell() {
        tableView.register(AccountSummaryTabelViewCell.nib, forCellReuseIdentifier: AccountSummaryTabelViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: "AccountSummaryTableSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "AccountSummaryTableSectionHeaderView")
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryTabelViewCell.reuseIdentifier, for: indexPath) as! AccountSummaryTabelViewCell
        cell.label.text = tableData[indexPath.section].items[indexPath.row]
        cell.cellImage.image = UIImage(named: tableData[indexPath.section].items[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let sectionHeader =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "AccountSummaryTableSectionHeaderView") as? AccountSummaryTableSectionHeaderView
        sectionHeader?.title.text = tableData[section].section
        return sectionHeader

    }



}

extension AccountSummaryViewController: UITableViewDelegate {

}



