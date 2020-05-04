//
//  UIImageView.swift
//  NBA App
//
//  Created by neopandu on 26/04/20.
//  Copyright © 2020 neo studio ID. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, onWillLoad: ((UIImage) -> Void)?) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    if let onload = onWillLoad {
                        onload(image)
                    }
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
