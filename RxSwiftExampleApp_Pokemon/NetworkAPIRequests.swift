//
//  NetworkAPIRequests.swift
//  RxSwiftExampleApp_Pokemon
//
//  Created by Frank on 8/5/21.
//

import Foundation
import RxSwift

public enum RequestType: String {
    case GET, POST, PUT, DELETE
}

class APIRequest {
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    var method = RequestType.GET
    var parameters = [String: String]()

    func request(with baseURL: URL) -> URLRequest {
           var request = URLRequest(url: baseURL)
            request.httpMethod = method.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            return request
        }
}


class APICall {

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: PokemonData = try JSONDecoder().decode(PokemonData.self, from: data ?? Data())
                    observer.onNext( model.results as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}

