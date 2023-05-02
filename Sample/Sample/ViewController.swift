//
//  ViewController.swift
//  Sample
//
//  Created by Rashid Ramazanov on 8/2/22.
//

import CountryPicker
import UIKit

class ViewController: UIViewController {
    @IBAction func pick() {
        startPicker()
    }

    private func startPicker() {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "TR"
        countryPicker.delegate = self
        present(countryPicker, animated: true)
    }
}

extension ViewController: CountryPickerDelegate {
    func countryPicker(didSelect country: Country) {
        print(country.localizedName)
    }
}
