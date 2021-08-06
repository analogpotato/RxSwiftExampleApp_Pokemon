//
//  TableViewDataSource.swift
//  RxSwiftExampleApp_Pokemon
//
//  Created by Frank on 8/5/21.
//

import Foundation
import UIKit
import RxSwift

class TableViewDataSource: NSObject, UITableViewDataSource {

    var pokemonData: [Pokemon] = []

    func submitData(_ newList: [Pokemon]) {
        self.pokemonData = newList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemonData[indexPath.row].name
        return cell
    }





}
