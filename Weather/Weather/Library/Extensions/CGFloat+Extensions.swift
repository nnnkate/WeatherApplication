//
//  CGFloat+Extensions.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 28.07.22.
//

import Foundation
import UIKit

extension CGFloat {
    func adaptedFontSize() -> CGFloat {
        self * UIScreen.main.bounds.height / 390
    }
}
