import XCTest
@testable import CountryPicker

final class CountryPickerTests: XCTestCase {
    func test_countriesCount() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), CountryManager.shared.getCountries().count)
    }

    func test_selectedCountry() throws {
        let sut = makeSUT()
        sut.selectedCountry = "US"
        let countries = CountryManager.shared.getCountries()
        let selectedCountry = try XCTUnwrap(countries.first(where: { $0.isoCode == sut.selectedCountry }))
        let firstCell = try XCTUnwrap(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CountryPickerCell)
        XCTAssertEqual(firstCell.countryCodeLabel.text, "+" + selectedCountry.phoneCode)
    }

    func test_searchCountry() {
        let sut = makeSUT()
        CountryManager.shared.localeIdentifier = "en_US"
        sut.selectedCountry = "US"
        sut.searchTextField.text = "Turkey"
        sut.filter(for: sut.searchTextField.text)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testDefaultPhoneCode() {
        let country = Country(isoCode: "KZ")
        XCTAssertEqual(country.phoneCode, "7")
    }

    func makeSUT() -> CountryPickerViewController {
        CountryPickerViewController()
    }
}
