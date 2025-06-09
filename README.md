# OnboardingKit
**OnboardingKit**  is a lightweight and customizable Swift Package designed to simplify the implementation of onboarding flows in SwiftUI-based iOS apps. 
It provides a structured, modular system for defining and presenting onboarding slides, allowing teams to plug in their own content while reusing a common logic layer.

## 📦 Features

- Modular, reusable SwiftUI components
- Slide-based onboarding architecture
- Customizable themes and UI styles
- Support for progress indicators
- MVVM-based structure with ViewModel logic

## 🚀 Installation

Use Swift Package Manager to add OnboardingKit to your project:

1. Open your project in Xcode.
2. Go to `File > Add Packages`.
3. Enter the URL of this repository.
4. Select the version you want to use.

## 🛠️ Usage

### 1. Import the package:

```swift
import OnboardingKit
```

### 2. Define your slides:

```swift
let slides = [
    OnboardingSlide(title: "Welcome", description: "Thanks for installing!", imageName: "welcome"),
    OnboardingSlide(title: "Stay Organized", description: "Keep track of your tasks easily.", imageName: "organize"),
    OnboardingSlide(title: "Get Notified", description: "Receive smart reminders.", imageName: "notify")
]
```

### 3. Use LiveOnBoardingBuilder to build your Onboarding View:
```swift
var builder = LiveOnboardingBuilder()
```    

Configure ViewModel:
```swift
builder
    .setViewModel(slides)
```

Configure UI:
```swift
    .setNextButtonConfiguration(ButtonUIConfiguration(title: "Next",
                                                      buttonStyle: PrimaryButtonStyle()))
    .setStartAppButtonConfiguration(ButtonUIConfiguration(title: "Start",
                                                          buttonStyle: PrimaryButtonStyle(),
                                                          {print("Start")}))
    .setProgressBarConfiguration(ProgressBarUIConfiguration())
    .setThemeStyle(OnboardingThemeStyle())
```

Build it:
```swift
builder
    .setViewModel(slides)
    .setNextButtonConfiguration(ButtonUIConfiguration(title: "Next",
                                                      buttonStyle: PrimaryButtonStyle()))
    .setStartAppButtonConfiguration(ButtonUIConfiguration(title: "Start",
                                                          buttonStyle: PrimaryButtonStyle(),
                                                          {print("Start")}))
    .setProgressBarConfiguration(ProgressBarUIConfiguration())
    .setThemeStyle(OnboardingThemeStyle())
    .buildView()
    
```

### 4. Use the view in SwiftUI:

```swift
struct SlideOnboardingView: View{
    var builder = LiveOnboardingBuilder()
    var body: some View {
        builder
            .setViewModel(slides)
            .setNextButtonConfiguration(ButtonUIConfiguration(title: "Next",
                                                              buttonStyle: PrimaryButtonStyle()))
            .setStartAppButtonConfiguration(ButtonUIConfiguration(title: "Start",
                                                                  buttonStyle: PrimaryButtonStyle(),
                                                                  {print("Start")}))
            .setProgressBarConfiguration(ProgressBarUIConfiguration())
            .setThemeStyle(OnboardingThemeStyle())
            .buildView()
    }
}
```

## 🎨 Customization

You can adjust the appearance using `OnboardingUIConfiguration` and custom styles (e.g., `PrimaryButtonStyle`, `ProgressBarView`, etc.). Themes and UI elements are modular and override-friendly.

## 📁 Folder Structure

- `UI`: Contains all visual components
- `Logic structures`: Contains models and ViewModels
- `Resources`: Localized strings, assets

## 📄 License

MIT License. See [LICENSE](LICENSE) for details.
