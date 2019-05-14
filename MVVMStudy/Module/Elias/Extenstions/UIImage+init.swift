//
//  UIImage+initFromURL.swift
//  PopUpCorn
//
//  Created by Elias Paulino on 12/02/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    /// fetch a image from url
    ///
    /// - Parameter url: the url of the target image
    /// - Throws: data conversion error
    convenience public init?(url: URL) {
        if let data = try? Data.init(contentsOf: url) {
            self.init(data: data)
        } else {
            return nil
        }
    }
}
