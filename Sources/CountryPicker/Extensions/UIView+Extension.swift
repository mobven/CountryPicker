//
//  UIView+Extensions.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020
//  Copyright © 2021 Mobven. All rights reserved.

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
