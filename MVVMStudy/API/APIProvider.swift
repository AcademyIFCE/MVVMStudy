//
//  APIProvider.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

struct APIProvider<T: Decodable & APIResponse> {

    func data(from route: APIRoutes, completion: @escaping (T?, Error?) -> Void ) {
        guard let url = URL(string: route.endpoint) else {
            completion(nil, nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(response, error)
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
