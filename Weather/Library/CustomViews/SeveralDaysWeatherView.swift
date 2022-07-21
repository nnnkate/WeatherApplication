//
//  SeveralDaysWeatherView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import Foundation
import UIKit

final class SeveralDaysWeatherView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupApearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func updateView() {
        
    }
    
    // MARK: - Private Methods
    
    private func setupApearance() {
        self.backgroundColor = .white
        self.addShadow(color: .white)
        self.layer.cornerRadius = 13.HAdapted
        self.layer.opacity = 0.5
    }
}
