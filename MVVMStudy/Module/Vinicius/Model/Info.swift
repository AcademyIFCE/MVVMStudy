//
//  Info.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 29/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String

    func nextPage() -> String {
        return trimPageURL(next)
    }

    func previousPage() -> String {
        return trimPageURL(prev)
    }

    func currentPage() -> String {
        if nextPage() != "" {
            if let nextPageInt = Int(nextPage()) {
                return "\(nextPageInt - 1)"
            }
        }
        else if previousPage() != "" {
            if let previousPageInt = Int(previousPage()) {
                return "\(previousPageInt + 1)"
            }
        }
        return "1"
    }

    private func trimPageURL(_ urlString: String) -> String {
        if let index = urlString.range(of: "=")?.upperBound {
            let pageSubString = (urlString[index...])
            let pageNum = String(pageSubString)
            return pageNum
        }
        return ""
    }
}
