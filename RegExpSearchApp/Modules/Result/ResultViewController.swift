//
//  ResultViewController.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import UIKit

final class ResultViewController: UIViewController, UITableViewDataSource {
    //MARK: -Views
    var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    //MARK: -Variables
    var dataSourceArray:[String] = []
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    //MARK: -Private methods
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 70.0
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ResultViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = dataSourceArray[indexPath.row]
        return cell
    }
}

