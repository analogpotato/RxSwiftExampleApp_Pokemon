//
//  ViewController.swift
//  RxSwiftExampleApp_Pokemon
//
//  Created by Frank on 8/5/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let dataModel = TableViewDataModel()
    let disposeBag = DisposeBag()
    let dataSource = TableViewDataSource()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        dataModel.pokemon.subscribe { [weak self] (pokemon) in
            self?.update(pokemon)
        } onError: { error in
            print(error)
        } onCompleted: {
            print("Completed! 🎉")
        } onDisposed: {
            print("Disposed! 🗑")
        }.disposed(by: disposeBag)

    }

    func setupTableView() {

        view.addSubview(tableView)

        tableView.dataSource = dataSource

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    func update(_ results: [Pokemon]) {
        DispatchQueue.main.async {
            self.dataSource.submitData(results)
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {

}
