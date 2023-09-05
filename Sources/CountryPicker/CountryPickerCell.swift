//
//  CountryPickerCell.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit

public final class CountryPickerCell: UITableViewCell {
    static let reuseIdentifier = "countryCell"

    lazy var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = CountryManager.shared.config.countryNameTextFont
        label.numberOfLines = 0
        label.textColor = CountryManager.shared.config.countryNameTextColor
        return label
    }()

    lazy var countryFlagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CountryManager.shared.config.countryImageHeight)
        return label
    }()

    lazy var countryCodeLabel: UILabel = {
        let label = UILabel()
        label.font = CountryManager.shared.config.countryCodeFont
        label.textColor = CountryManager.shared.config.countryCodeTextColor
        label.textAlignment = .right
        return label
    }()

    lazy var countryCodeContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CountryManager.shared.config.selectedCountryCodeCornerRadius
        return view
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable) required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        setupViews()
        setupLayouts()
    }

    func setupViews() {
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(countryFlagLabel)
        stackView.addArrangedSubview(countryNameLabel)

        if CountryManager.shared.config.showPhoneCodes {
            stackView.addArrangedSubview(countryCodeContainerView)
            countryCodeContainerView.addSubview(countryCodeLabel)
        }
    }

    func setupLayouts() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        if CountryManager.shared.config.showPhoneCodes {
            countryCodeContainerView.translatesAutoresizingMaskIntoConstraints = false
            countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
            countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false

            countryCodeLabel.setContentHuggingPriority(.required, for: .horizontal)
            countryCodeLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

            countryCodeLabel.leadingAnchor.constraint(equalTo: countryCodeContainerView.leadingAnchor, constant: 6)
                .isActive = true
            countryCodeLabel.trailingAnchor.constraint(equalTo: countryCodeContainerView.trailingAnchor, constant: -8)
                .isActive = true
            countryCodeLabel.topAnchor.constraint(equalTo: countryCodeContainerView.topAnchor, constant: 3).isActive = true
            countryCodeLabel.bottomAnchor.constraint(equalTo: countryCodeContainerView.bottomAnchor, constant: -3)
                .isActive = true
        }

        countryFlagLabel.setContentHuggingPriority(.required, for: .horizontal)
        countryFlagLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        stackView.spacing = CountryManager.shared.config.countryImageSpacing
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
    }

    func set(country: Country, selectedCountry: String) {
        accessibilityIdentifier = country.isoCode
        countryFlagLabel.text = country.isoCode.getFlag()
        countryNameLabel.text = country.localizedName
        countryCodeLabel.text = "+" + country.phoneCode

        if selectedCountry == country.isoCode {
            countryCodeContainerView.backgroundColor = CountryManager.shared.config.selectedCountryCodeBackgroundColor
            countryCodeLabel.textColor = CountryManager.shared.config.selectedCountryCodeTextColor
        } else {
            countryCodeContainerView.backgroundColor = .clear
            countryCodeLabel.textColor = CountryManager.shared.config.countryCodeTextColor
        }
    }
}
