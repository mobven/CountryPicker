# SwiftUI
To present `CountryPickerViewController` with SwiftUI, you need to create a `CountryPicker` representable.

```swift
import SwiftUI
import CountryPicker

struct CountryPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = CountryPickerViewController

    let countryPicker = CountryPickerViewController()

    @Binding var country: Country?

    func makeUIViewController(context: Context) -> CountryPickerViewController {
        countryPicker.selectedCountry = "TR"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }

    func updateUIViewController(_ uiViewController: CountryPickerViewController, context: Context) {
        //
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPicker
        init(_ parent: CountryPicker) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}
```

You can then present created `CountryPicker`:

```swift
import SwiftUI
import CountryPicker

struct ContentView: View {
    @State private var country: Country?
    @State private var showCountryPicker = false

    var body: some View {
        VStack {
            Button {
                showCountryPicker = true
            } label: {
                Text("Select Country")
            }.sheet(isPresented: $showCountryPicker) {
                CountryPicker(country: $country)
            }
        }
    }
}
```
