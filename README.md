# CountryPicker

Very simple country picker with fresh design.

## Screenshots
<img src= "Screenshots/iPhone-12-white.png" width="275" height = "500">|<img src= "Screenshots/iPhone-12-dark-mode.png" width="275" height = "500">| <img src= "Screenshots/iPhone-12-white-arabic.png" width="275" height = "500">

## Installation

Currently CountryPicker is only avaliable via SPM. You can also add manually to your project.

### SPM
Add 
```
https://github.com/mobven/CountryPicker.git
```

## Usage

Basically, you can present CountryPicker in your ViewController with creating instance from `CountryPickerViewController`. You can set default country for the picker with selectedCountry variable (Default value is "TR"). For using delegate method you can just conform `CountryPickerDelegate` in your `ViewController`.

```
let countryPicker = CountryPickerViewController()
countryPicker.selectedCountry = "TR"
countryPicker.delegate = self
self.present(countryPicker, animated: true)
```

#### CountryPickerDelegate

Delegate method will be called with country selection, you can update your outlets  with country model.

```
public protocol CountryPickerDelegate: AnyObject {
    func countryPicker(didSelect country: Country)
}

extension ViewController: CountryPickerDelegate {
    func countryPicker(didSelect country: Country) {
        countryTextField.text = country.isoCode.getFlag() + " " + country.localizedName
    }
}
```

#### Customization

Default picker theme is supporting Dark Mode for iO13+ devices. You can easly customize the picker with editing `Configuration` properties. If you are adding custom colors, you should add dark appearance color for dark mode support.

```
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
```
  Example customization
```
  CountryManager.shared.config.countryNameTextColor = .black
  CountryManager.shared.config.countryNameTextFont = UIFont.systemFont(ofSize: 16)
```

## What's next
- [ ] SwiftUI version. 
- [ ] Support for iOS 13 Below.
  
---
Developed with 🖤 at [Mobven](https://mobven.com/)