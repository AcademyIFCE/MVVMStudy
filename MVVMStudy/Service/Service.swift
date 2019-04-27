//
//  Service.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation


class Service {
    static let shared = Service()
    func fetchCharacthers(completion: @escaping ([Characters], Error?) -> () ) {
        let urlString: String = "https://rickandmortyapi.com/api/character/2"
        guard let url = URL(string: urlString) else {return}
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            if let error = err {
                print("Rejected API Result",error)
                completion([], error)
                return
            }
            do {
                 let result = try JSONDecoder().decode(Characters.self, from: data)
                completion([result], nil)
            } catch let error {
                print("Rejected API Result",error)
                completion([], error)
            }
        }.resume()
    }
}
