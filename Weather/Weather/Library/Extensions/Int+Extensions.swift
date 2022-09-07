//
//  Int+Extensions.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 28.07.22.
//

import Foundation
import UIKit

extension Int {
    var verticalAdapted: CGFloat {
        CGFloat(self) * UIScreen.main.bounds.width / 844
    }
    
    var horizontalAdapted: CGFloat {
        CGFloat(self) * UIScreen.main.bounds.height / 390
    }
}
