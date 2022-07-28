//
//  SearchTextField.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 28.07.22.
//

import Foundation
import UIKit

class SearchTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        setupApearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance Methods

private extension SearchTextField {
    private func setupApearance() {
        self.backgroundColor = .white
        self.tintColor = .gray
        self.textColor = .gray
        
        self.layer.cornerRadius = 25.verticalAdapted
        
        self.placeholder = NSLocalizedString("searchBarPlaceholder", comment: "")
        
        let iconView = UIImageView(frame: CGRect(x: 5.horizontalAdapted, y: 15.verticalAdapted, width: 10.horizontalAdapted, height: 8.horizontalAdapted))
        iconView.image = UIImage(systemName: "magnifyingglass")
        let iconContainerView: UIView = UIView(frame: CGRect(x: 15.horizontalAdapted, y: 0, width: 15.horizontalAdapted, height: 15.horizontalAdapted))
        iconContainerView.addSubview(iconView)

        self.leftView = iconContainerView
        self.leftViewMode = .always
    }
}
