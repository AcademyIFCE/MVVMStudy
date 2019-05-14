//
//  APIImageProvider.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

struct APIImageProvider {

    @discardableResult
    func data(from path: String, completion: @escaping (URL?, Error?) -> Void ) -> URLSessionDownloadTask? {

        guard let url = URL(string: path) else {
            completion(nil, nil)
            return nil
        }

        let downloadTask = URLSession.shared.downloadTask(with: url) { (url, _, error) in

            guard let imageUrl = url else {
                completion(nil, error)
                return
            }

            completion(imageUrl, nil)
        }

        downloadTask.resume()

        return downloadTask
    }
}
