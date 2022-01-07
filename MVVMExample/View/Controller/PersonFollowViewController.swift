//
//  ViewController.swift
//  MVVMExample
//
//  Created by Arleson Silva on 07/01/22.
//

import UIKit

class PersonFollowViewController: UIViewController {

    private var models = [Person]()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(PersonFollowTableViewCell.self,
                       forCellReuseIdentifier: PersonFollowTableViewCell.indentifier)
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupContraints()
        configureModel()
    }
    
    private func setupUI() {
        title = "Home"
    }

    private func setupLayout() {
        view.addSubview(tableView)
    }

    private func setupContraints() {
        tableView.frame = view.bounds
    }

    private func configureModel() {
        let persons = [
            "Joe", "Dan", "Jeff", "Jenny", "Emily"
        ]
        for name in persons {
            models.append(Person(name: name))
        }
    }
}

extension PersonFollowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonFollowTableViewCell.indentifier,
            for: indexPath
        ) as? PersonFollowTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: PersonFollowTableViewCellViewModel(with: model))
        cell.delegate = self
        return cell
    }
}

extension PersonFollowViewController: PersonFollowTableViewCellDelegate {
    func personFollowTableViewCellDelegate(_ cell: PersonFollowTableViewCell,
                                           didTapWith viewModel: PersonFollowTableViewCellViewModel) {
    }
}
