//
//  CountryPicker.swift
//  CountryPicker
//
//  Created by Samet MACİT on 29.12.2020.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit

public protocol CountryPickerDelegate: AnyObject {
    func countryPicker(didSelect country: Country)
}

public final class CountryPickerViewController: UIViewController {
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCompatibility.systemBackground
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = CountryManager.shared.config.titleText
        label.font = CountryManager.shared.config.titleFont
        label.textColor = CountryManager.shared.config.titleTextColor
        return label
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle(CountryManager.shared.config.closeButtonText, for: .normal)
        button.setTitleColor(CountryManager.shared.config.closeButtonTextColor, for: .normal)
        button.titleLabel?.font = CountryManager.shared.config.closeButtonFont
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()

    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = CountryManager.shared.config.searchBarCornerRadius
        textField.backgroundColor = CountryManager.shared.config.searchBarBackgroundColor
        textField.delegate = self
        textField.font = CountryManager.shared.config.searchBarFont
        textField.attributedPlaceholder = NSAttributedString(
            string: CountryManager.shared.config.searchBarPlaceholder,
            attributes: [
                NSAttributedString.Key.foregroundColor:
                    CountryManager.shared.config.searchBarPlaceholderColor
            ]
        )
        setSearchIcon(textField)
        setClearButton(textField)
        return textField
    }()

    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = CountryManager.shared.config.separatorColor
        return view
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryPickerCell.self, forCellReuseIdentifier: CountryPickerCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    /// Add search icon to textfield, default asset is "02Icons16X16Search"
    private func setSearchIcon(_ textField: UITextField) {
        let outerView =
            UIView(frame: CGRect(x: iconPadding, y: 0, width: iconHeight + (iconPadding * 2), height: iconHeight))
        let iconView = UIImageView(frame: CGRect(x: iconPadding, y: 0, width: iconHeight, height: iconHeight))
        iconView.image = CountryManager.shared.config.searchBarLeftImage ?? UIImage(
            named: "02Icons16X16Search",
            in: .module,
            compatibleWith: nil
        )
        outerView.addSubview(iconView)
        textField.leftView = outerView
        textField.leftViewMode = .always
    }

    /// Add custom image for clear button, default is textFields clear image.
    private func setClearButton(_ textField: UITextField) {
        if let image = CountryManager.shared.config.searchBarClearImage {
            let outerView = UIView(frame: CGRect(x: 0, y: 0, width: iconHeight + iconPadding, height: iconHeight))
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: iconHeight, height: iconHeight))
            button.setImage(image, for: .normal)
            button.addTarget(self, action: #selector(clearText), for: .touchUpInside)
            outerView.addSubview(button)
            textField.rightView = outerView
            textField.rightViewMode = .whileEditing
        } else {
            textField.clearButtonMode = .whileEditing
        }
    }

    public weak var delegate: CountryPickerDelegate?

    // MARK: - Constants

    private let iconPadding: CGFloat = 12
    private let iconHeight: CGFloat = 16
    private let estimatedCellHeight: CGFloat = 52

    private var countries: [Country] = []
    private var filteredCountries: [Country] = []

    /// selectedCountry will be shown in the first cell, default is "TR"
    public var selectedCountry: String = "TR" {
        didSet {
            if let selectedIndex = countries.firstIndex(where: { $0.isoCode == selectedCountry }) {
                let country = countries[selectedIndex]
                countries.remove(at: selectedIndex)
                countries.insert(country, at: 0)
                filteredCountries = countries
            }
        }
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        countries = CountryManager.shared.getCountries()
        filteredCountries = countries
        tableView.reloadData()
    }

    func setup() {
        setupViews()
        setupLayouts()
    }

    func setupViews() {
        headerView.addSubviews(
            titleLabel,
            closeButton,
            searchTextField,
            separatorView
        )
        view.addSubviews(tableView, headerView)
    }

    func setupLayouts() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 132).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 21).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true

        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -21).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true

        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
    }

    @objc func close() {
        dismiss(animated: true)
    }

    // MARK: - TextField Methods

    @objc func clearText() {
        searchTextField.text = ""
        filter(for: searchTextField.text)
    }

    func filter(for query: String?) {
        if query?.count == 0 {
            filteredCountries = countries
        } else if let text = query {
            filteredCountries = countries
                .filter { $0.localizedName.localizedLowercase.contains(text.localizedLowercase) }
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension CountryPickerViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CountryPickerCell.reuseIdentifier,
            for: indexPath
        )
            as? CountryPickerCell else { return UITableViewCell() }
        let item = filteredCountries[indexPath.row]
        cell.set(country: item, selectedCountry: selectedCountry)
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        estimatedCellHeight
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.countryPicker(didSelect: self.filteredCountries[indexPath.row])
        dismiss(animated: true)
    }
}

extension CountryPickerViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String
    ) -> Bool {
        guard let text = textField.text else { return true }
        let finalText = NSString(string: text).replacingOccurrences(of: text, with: string, range: range)
        filter(for: finalText)
        return true
    }
}
