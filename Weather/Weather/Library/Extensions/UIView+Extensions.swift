//
//  UIView+Extensions.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(color: UIColor, shadowRadius: CGFloat = 17, shadowOpacity: Float = 0.8) {
        layer.borderWidth = 0
        layer.shadowColor =  color.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
}
