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
    @available(*, deprecated, message: "Use `closeButtonStyle` instead")
    var closeButtonText: String { get set }
    var closeButtonStyle: DismissButtonStyle { get set }
    var titleTextColor: UIColor { get set }
    var titleFont: UIFont { get set }
    var titleText: String { get set }
    var searchBarPlaceholder: String { get set }
    var searchBarBackgroundColor: UIColor { get set }
    var searchBarPlaceholderColor: UIColor { get set }
    var searchBarFont: UIFont { get set }
    var searchBarHeight: CGFloat { get set }
    var searchBarInsets: UIEdgeInsets { get set }
    var searchBarLeftImage: UIImage? { get set }
    var searchBarClearImage: UIImage? { get set }
    var searchBarCornerRadius: CGFloat { get set }
    var separatorColor: UIColor { get set }
    var showPhoneCodes: Bool { get set }
    var showNotch: Bool {get set }
    var showTopSeperator: Bool {get set }
    var countriesSortingComparisonResult: ComparisonResult { get set }
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
    @available(*, deprecated, message: "Use `closeButtonStyle` instead")
    public var closeButtonTextColor: UIColor

    /// font of closeButton
    @available(*, deprecated, message: "Use `closeButtonStyle` instead")
    public var closeButtonFont: UIFont

    /// text of closeButton
    @available(*, deprecated, message: "Use `closeButtonStyle` instead")
    public var closeButtonText: String

    /// The style of the close button, which can be either an icon or a text title.
    public var closeButtonStyle: DismissButtonStyle

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

    /// height of searchTextField
    public var searchBarHeight: CGFloat

    /// insets of searchTextField
    public var searchBarInsets: UIEdgeInsets

    /// left image of searchTextField
    public var searchBarLeftImage: UIImage?

    /// clear image of searchTextField
    public var searchBarClearImage: UIImage?

    /// corner radius of searchTextField
    public var searchBarCornerRadius: CGFloat

    /// background color of separatorView
    public var separatorColor: UIColor

    /// show /  hide phone numbers
    public var showPhoneCodes: Bool

    /// show /  hide notch
    public var showNotch: Bool

    /// show / hide topSeperator
    public var showTopSeperator: Bool

    /// sort by localized country names
    public var countriesSortingComparisonResult: ComparisonResult

    @available(*, deprecated, message: "Use initializer with `closeButtonStyle` instead")
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
        searchBarHeight: CGFloat = 40.0,
        searchBarInsets: UIEdgeInsets = UIEdgeInsets(top: 23.0, left: 20.0, bottom: -21.0, right: -20.0),
        searchBarLeftImage: UIImage? = nil,
        searchBarClearImage: UIImage? = nil,
        searchBarCornerRadius: CGFloat = 4,
        separatorColor: UIColor = ColorCompatibility.systemGray5,
        showPhoneCodes: Bool = true,
        showNotch: Bool = false,
        showTopSeperator: Bool = true,
        countriesSortingComparisonResult: ComparisonResult = .orderedSame
    ) {
        self.init(
            countryNameTextColor: countryNameTextColor,
            countryNameTextFont: countryNameTextFont,
            selectedCountryCodeBackgroundColor: selectedCountryCodeBackgroundColor,
            selectedCountryCodeTextColor: selectedCountryCodeTextColor,
            selectedCountryCodeCornerRadius: selectedCountryCodeCornerRadius,
            countryCodeFont: countryCodeFont,
            countryCodeTextColor: countryCodeTextColor,
            closeButtonStyle: .title(
                title: closeButtonText, textColor: closeButtonTextColor, font: closeButtonFont
            ),
            titleTextColor: titleTextColor,
            titleFont: titleFont,
            titleText: titleText,
            searchBarPlaceholder: searchBarPlaceholder,
            searchBarBackgroundColor: searchBarBackgroundColor,
            searchBarPlaceholderColor: searchBarPlaceholderColor,
            searchBarFont: searchBarFont,
            searchBarHeight: searchBarHeight,
            searchBarInsets: searchBarInsets,
            searchBarLeftImage: searchBarLeftImage,
            searchBarClearImage: searchBarClearImage,
            searchBarCornerRadius: searchBarCornerRadius,
            separatorColor: separatorColor,
            showPhoneCodes: showPhoneCodes,
            showNotch: showNotch,
            showTopSeperator: showTopSeperator,
            countriesSortingComparisonResult: countriesSortingComparisonResult
        )
    }

    public init(
        countryNameTextColor: UIColor = ColorCompatibility.label,
        countryNameTextFont: UIFont = UIFont.systemFont(ofSize: 16),
        selectedCountryCodeBackgroundColor: UIColor = .systemGreen,
        selectedCountryCodeTextColor: UIColor = ColorCompatibility.systemBackground,
        selectedCountryCodeCornerRadius: CGFloat = 8,
        countryCodeFont: UIFont = UIFont.systemFont(ofSize: 16),
        countryCodeTextColor: UIColor = ColorCompatibility.systemGray2,
        closeButtonStyle: DismissButtonStyle = .title(
            title: "Close", textColor: .systemGreen, font: .systemFont(ofSize: 16)
        ),
        titleTextColor: UIColor = ColorCompatibility.label,
        titleFont: UIFont = UIFont.boldSystemFont(ofSize: 18),
        titleText: String = "Select Country",
        searchBarPlaceholder: String = "Search...",
        searchBarBackgroundColor: UIColor = ColorCompatibility.systemGray5,
        searchBarPlaceholderColor: UIColor = ColorCompatibility.systemGray2,
        searchBarFont: UIFont = UIFont.systemFont(ofSize: 16),
        searchBarHeight: CGFloat = 40.0,
        searchBarInsets: UIEdgeInsets = UIEdgeInsets(top: 23.0, left: 20.0, bottom: -21.0, right: -20.0),
        searchBarLeftImage: UIImage? = nil,
        searchBarClearImage: UIImage? = nil,
        searchBarCornerRadius: CGFloat = 4,
        separatorColor: UIColor = ColorCompatibility.systemGray5,
        showPhoneCodes: Bool = true,
        showNotch: Bool = false,
        showTopSeperator: Bool = true,
        countriesSortingComparisonResult: ComparisonResult = .orderedSame
    ) {
        self.countryNameTextColor = countryNameTextColor
        self.countryNameTextFont = countryNameTextFont
        self.selectedCountryCodeBackgroundColor = selectedCountryCodeBackgroundColor
        self.selectedCountryCodeTextColor = selectedCountryCodeTextColor
        self.countryCodeFont = countryCodeFont
        self.countryCodeTextColor = countryCodeTextColor
        self.selectedCountryCodeCornerRadius = selectedCountryCodeCornerRadius
        self.closeButtonTextColor = .systemGreen
        self.closeButtonFont = UIFont.systemFont(ofSize: 16)
        self.closeButtonText = "Close"
        self.closeButtonStyle = closeButtonStyle
        self.titleTextColor = titleTextColor
        self.titleFont = titleFont
        self.searchBarHeight = searchBarHeight
        self.searchBarInsets = searchBarInsets
        self.titleText = titleText
        self.searchBarPlaceholder = searchBarPlaceholder
        self.searchBarBackgroundColor = searchBarBackgroundColor
        self.searchBarPlaceholderColor = searchBarPlaceholderColor
        self.searchBarFont = searchBarFont
        self.searchBarLeftImage = searchBarLeftImage
        self.searchBarClearImage = searchBarClearImage
        self.searchBarCornerRadius = searchBarCornerRadius
        self.separatorColor = separatorColor
        self.showPhoneCodes = showPhoneCodes
        self.showNotch = showNotch
        self.showTopSeperator = showTopSeperator
        self.countriesSortingComparisonResult = countriesSortingComparisonResult
    }
}
