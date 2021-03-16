//
//  Configuration.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020.
//  Copyright © 2021 Mobven. All rights reserved.
/*
    Theme configuration for Country Picker. Default config is support dark mode
 */

import Foundation
import UIKit

public protocol Configuration {
    var countryNameTextColor: UIColor { get set }
    var countryNameTextFont: UIFont { get set }
    var selectedCountryCodeBackgroundColor: UIColor { get set }
    var selectedCountryCodeTextColor: UIColor { get set }
    var countryCodeFont: UIFont { get set }
    var countryCodeTextColor: UIColor { get set }
    var countryCodeCornerRadius: CGFloat { get set }
    var closeButtonTextColor: UIColor { get set }
    var closeButtonFont: UIFont { get set }
    var titleTextColor: UIColor { get set }
    var titleFont: UIFont { get set }
    var searchBarPlaceholder: String { get set }
    var closeButtonText: String { get set }
    var titleText: String { get set }
    var separatorColor: UIColor { get set }
    var searchBarBackgroundColor: UIColor { get set }
    var searchBarPlaceholderColor: UIColor { get set }
    var searchBarFont: UIFont { get set }
    var searchBarLeftImage: UIImage? { get set }
    var searchBarClearImage: UIImage? { get set }
    var searchBarCornerRadius: CGFloat { get set }
}

public struct Config: Configuration {
    public var countryNameTextColor: UIColor
    public var countryNameTextFont: UIFont
    public var selectedCountryCodeBackgroundColor: UIColor
    public var selectedCountryCodeTextColor: UIColor
    public var countryCodeFont: UIFont
    public var countryCodeTextColor: UIColor
    public var countryCodeCornerRadius: CGFloat
    public var closeButtonTextColor: UIColor
    public var closeButtonFont: UIFont
    public var titleTextColor: UIColor
    public var titleFont: UIFont
    public var searchBarPlaceholder: String
    public var closeButtonText: String
    public var titleText: String
    public var separatorColor: UIColor
    public var searchBarBackgroundColor: UIColor
    public var searchBarPlaceholderColor: UIColor
    public var searchBarFont: UIFont
    public var searchBarLeftImage: UIImage?
    public var searchBarClearImage: UIImage?
    public var searchBarCornerRadius: CGFloat

    public init(
        countryNameTextColor: UIColor = .label,
        countryNameTextFont: UIFont = UIFont.systemFont(ofSize: 16),
        selectedCountryCodeBackgroundColor: UIColor = .systemGreen,
        selectedCountryCodeTextColor: UIColor = .systemBackground,
        countryCodeFont: UIFont = UIFont.systemFont(ofSize: 16),
        countryCodeTextColor: UIColor = .systemGray2,
        countryCodeCornerRadius: CGFloat = 8,
        closeButtonTextColor: UIColor = .systemGreen,
        closeButtonFont: UIFont = UIFont.systemFont(ofSize: 16),
        titleTextColor: UIColor = .label,
        titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18),
        searchBarPlaceholder: String = "Search...",
        closeButtonText: String = "Close",
        titleText: String = "Select Country",
        separatorColor: UIColor = .systemGray5,
        searchBarBackgroundColor: UIColor = .systemGray5,
        searchBarPlaceholderColor: UIColor = .systemGray2,
        searchBarFont: UIFont = UIFont.systemFont(ofSize: 16),
        searchBarLeftImage: UIImage? = nil,
        searchBarClearImage: UIImage? = nil,
        searchBarCornerRadius: CGFloat = 4
    ) {
        self.countryNameTextColor = countryNameTextColor
        self.countryNameTextFont = countryNameTextFont
        self.selectedCountryCodeBackgroundColor = selectedCountryCodeBackgroundColor
        self.selectedCountryCodeTextColor = selectedCountryCodeTextColor
        self.countryCodeFont = countryCodeFont
        self.countryCodeTextColor = countryCodeTextColor
        self.countryCodeCornerRadius = countryCodeCornerRadius
        self.closeButtonTextColor = closeButtonTextColor
        self.closeButtonFont = closeButtonFont
        self.titleTextColor = titleTextColor
        self.titleFont = titleFont
        self.searchBarPlaceholder = searchBarPlaceholder
        self.closeButtonText = closeButtonText
        self.titleText = titleText
        self.separatorColor = separatorColor
        self.searchBarBackgroundColor = searchBarBackgroundColor
        self.searchBarPlaceholderColor = searchBarPlaceholderColor
        self.searchBarFont = searchBarFont
        self.searchBarLeftImage = searchBarLeftImage
        self.searchBarClearImage = searchBarClearImage
        self.searchBarCornerRadius = searchBarCornerRadius
    }
}
