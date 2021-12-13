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
    var selectedCountryCodeCornerRadius: CGFloat { get set }
    var countryCodeFont: UIFont { get set }
    var countryCodeTextColor: UIColor { get set }
    var closeButtonTextColor: UIColor { get set }
    var closeButtonFont: UIFont { get set }
    var closeButtonText: String { get set }
    var titleTextColor: UIColor { get set }
    var titleFont: UIFont { get set }
    var titleText: String { get set }
    var searchBarPlaceholder: String { get set }
    var searchBarBackgroundColor: UIColor { get set }
    var searchBarPlaceholderColor: UIColor { get set }
    var searchBarFont: UIFont { get set }
    var searchBarLeftImage: UIImage? { get set }
    var searchBarClearImage: UIImage? { get set }
    var searchBarCornerRadius: CGFloat { get set }
    var separatorColor: UIColor { get set }
}

public struct Config: Configuration {
    
    /// textColor of countryNameLabel
    public var countryNameTextColor: UIColor
    
    /// font of countryNameLabel
    public var countryNameTextFont: UIFont
    
    /// background color of countryCodeLabel's selected state
    public var selectedCountryCodeBackgroundColor: UIColor
    
    /// textColor of countryCodeLabel's selected state
    public var selectedCountryCodeTextColor: UIColor
    
    /// corner radius of countryCodeLabel's selected state
    public var selectedCountryCodeCornerRadius: CGFloat
    
    /// font of countryCodeLabel
    public var countryCodeFont: UIFont
    
    /// textColor of countryCodeLabel
    public var countryCodeTextColor: UIColor
    
    /// textColor of closeButton
    public var closeButtonTextColor: UIColor
    
    /// font of closeButton
    public var closeButtonFont: UIFont
    
    // text of closeButton
    public var closeButtonText: String
    
    /// textColor of titleLabel
    public var titleTextColor: UIColor
    
    /// font of titleLabel
    public var titleFont: UIFont

    /// text of titleLabel
    public var titleText: String

    /// placeholder text of searchTextField
    public var searchBarPlaceholder: String
    
    /// background color  of searchTextField
    public var searchBarBackgroundColor: UIColor
    
    /// placeholder text color of searchTextField
    public var searchBarPlaceholderColor: UIColor
    
    /// font of searchTextField
    public var searchBarFont: UIFont
    
    /// left image of searchTextField
    public var searchBarLeftImage: UIImage?
    
    /// clear image of searchTextField
    public var searchBarClearImage: UIImage?
    
    /// corner radius of searchTextField
    public var searchBarCornerRadius: CGFloat
    
    /// background color of separatorView
    public var separatorColor: UIColor

    public init(
        countryNameTextColor: UIColor = ColorCompatibility.label,
        countryNameTextFont: UIFont = UIFont.systemFont(ofSize: 16),
        selectedCountryCodeBackgroundColor: UIColor = .systemGreen,
        selectedCountryCodeTextColor: UIColor = ColorCompatibility.systemBackground,
        selectedCountryCodeCornerRadius: CGFloat = 8,
        countryCodeFont: UIFont = UIFont.systemFont(ofSize: 16),
        countryCodeTextColor: UIColor = ColorCompatibility.systemGray2,
        closeButtonTextColor: UIColor = .systemGreen,
        closeButtonFont: UIFont = UIFont.systemFont(ofSize: 16),
        closeButtonText: String = "Close",
        titleTextColor: UIColor = ColorCompatibility.label,
        titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18),
        titleText: String = "Select Country",
        searchBarPlaceholder: String = "Search...",
        searchBarBackgroundColor: UIColor = ColorCompatibility.systemGray5,
        searchBarPlaceholderColor: UIColor = ColorCompatibility.systemGray2,
        searchBarFont: UIFont = UIFont.systemFont(ofSize: 16),
        searchBarLeftImage: UIImage? = nil,
        searchBarClearImage: UIImage? = nil,
        searchBarCornerRadius: CGFloat = 4,
        separatorColor: UIColor = ColorCompatibility.systemGray5
    ) {
        self.countryNameTextColor = countryNameTextColor
        self.countryNameTextFont = countryNameTextFont
        self.selectedCountryCodeBackgroundColor = selectedCountryCodeBackgroundColor
        self.selectedCountryCodeTextColor = selectedCountryCodeTextColor
        self.countryCodeFont = countryCodeFont
        self.countryCodeTextColor = countryCodeTextColor
        self.selectedCountryCodeCornerRadius = selectedCountryCodeCornerRadius
        self.closeButtonTextColor = closeButtonTextColor
        self.closeButtonFont = closeButtonFont
        self.closeButtonText = closeButtonText
        self.titleTextColor = titleTextColor
        self.titleFont = titleFont
        self.titleText = titleText
        self.searchBarPlaceholder = searchBarPlaceholder
        self.searchBarBackgroundColor = searchBarBackgroundColor
        self.searchBarPlaceholderColor = searchBarPlaceholderColor
        self.searchBarFont = searchBarFont
        self.searchBarLeftImage = searchBarLeftImage
        self.searchBarClearImage = searchBarClearImage
        self.searchBarCornerRadius = searchBarCornerRadius
        self.separatorColor = separatorColor
    }
}
