//
//  File.swift
//  RxSwiftExampleApp_Pokemon
//
//  Created by Frank on 8/5/21.
//

import Foundation

struct PokemonData: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
}
