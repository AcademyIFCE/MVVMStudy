//
//  Service.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class Service: APIRickAndMortyDelegate {
    static let shared = Service()
    func getCharacter(name: String, page: String, completion: @escaping ([Character]?, Info?) -> Void) {
        let urlString: String = "https://rickandmortyapi.com/api/character"
        guard let url: URL = URL(string: urlString) else {return}
        let urlSession: URLSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, _, err) in
            if let error = err {
                print("Fatal Error",error)
                return
            }
            guard let data = data else {return}
            do {
                let results = try? JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(results?.results, results?.info)
            } catch let error {
                print("Fatal error in transformable", error)
            }
        }
    }
}
