# iOS Calculator App

A simple, elegant calculator app built with SwiftUI for iOS. This is a beginner-friendly project that demonstrates fundamental iOS app development concepts.

## Features

- ✅ Basic arithmetic operations (addition, subtraction, multiplication, division)
- ✅ Decimal number support
- ✅ Clear function (C)
- ✅ Plus/minus toggle (±)
- ✅ Percentage calculations
- ✅ Error handling (division by zero)
- ✅ Professional UI design inspired by iOS Calculator
- ✅ Responsive layout for different screen sizes

## Screenshots

The app features a clean, dark interface with:
- Large, easy-to-read display
- Color-coded buttons (orange for operations, gray for functions, dark gray for numbers)
- Rounded corners and proper spacing
- Professional typography

## Technical Details

- **Language**: Swift
- **Framework**: SwiftUI
- **Minimum iOS Version**: 18.5
- **Architecture**: MVVM pattern with state management

## Key Components

### State Management
```swift
@State private var display = "0"
@State private var previousNumber: Double = 0
@State private var currentNumber: Double = 0
@State private var operation: String = ""
@State private var userIsTyping = false
```

### Core Functions
- `numberPressed()` - Handles number input
- `performOperation()` - Manages arithmetic operations
- `equals()` - Calculates and displays results
- `clear()` - Resets calculator state
- `formatNumber()` - Formats display output

## How to Run

1. Open `my-calculator.xcodeproj` in Xcode
2. Select an iOS simulator (iPhone 15 Pro recommended)
3. Press `Cmd+R` or click the "Play" button
4. The app will build and launch in the simulator

## Learning Objectives

This project demonstrates:
- SwiftUI layout systems (VStack, HStack)
- State management with `@State` property wrapper
- Button handling and user interaction
- Number formatting and display
- Error handling in Swift
- iOS app structure and organization

## Code Structure

```
my-calculator/
├── ContentView.swift          # Main calculator interface and logic
├── my_calculatorApp.swift     # App entry point
└── Assets.xcassets/           # App icons and colors
```

## Future Enhancements

Potential improvements for learning:
- [ ] Memory functions (M+, M-, MR, MC)
- [ ] Scientific calculator functions
- [ ] History of calculations
- [ ] Landscape orientation support
- [ ] Haptic feedback
- [ ] Custom themes/colors
- [ ] Unit tests

## Requirements

- Xcode 15.0 or later
- iOS 18.5 or later
- macOS for development

## Author

Created as a learning project for iOS app development with SwiftUI.

## License

This project is open source and available under the [MIT License](LICENSE).
