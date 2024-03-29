//
//  UIIimageView+Extension.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
