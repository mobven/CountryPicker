//
//  UIStackView+Extensions.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020
//  Copyright © 2021 Mobven. All rights reserved.

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subViews: UIView...) {
        subViews.forEach(addArrangedSubview(_:))
    }
}
