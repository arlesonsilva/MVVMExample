//
//  ViewController.swift
//  MVVMExample
//
//  Created by Arleson Silva on 07/01/22.
//

import UIKit

struct Person {
    let name: String
}

class ViewController: UIViewController {

    private var models = [Person]()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
}
