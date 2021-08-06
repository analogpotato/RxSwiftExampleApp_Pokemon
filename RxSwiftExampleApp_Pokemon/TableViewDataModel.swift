//
//  TableViewDataModel.swift
//  RxSwiftExampleApp_Pokemon
//
//  Created by Frank on 8/5/21.
//

import Foundation
import RxSwift

class TableViewDataModel {

    private var apiCall = APICall()
    private let apiRequest = APIRequest()

    var pokemonSource : Observable<[Pokemon]> {
        return apiCall.send(apiRequest: apiRequest)
        }

    var pokemon : Observable<[Pokemon]> {
        return pokemonSource.flatMapLatest { (resource) -> Observable<[Pokemon]> in
            .just(resource)
        }
    }
}
