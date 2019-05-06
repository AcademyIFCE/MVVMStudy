//
//  RnMCellProtocol.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

typealias RnMCell = RnMCellProtocol & UICollectionViewCell

protocol RnMCellProtocol {
    func setup(with viewModel: RnMCellViewModel)
    static var cellIdentifier: String { get }
}

extension RnMCellProtocol {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
