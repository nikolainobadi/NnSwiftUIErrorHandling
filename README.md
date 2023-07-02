# NnSwiftUIErrorHandling

`NnSwiftUIErrorHandling` is a Swift package that simplifies error handling and loading state management in SwiftUI applications. It provides ready-to-use SwiftUI views and view modifiers that are designed to handle errors thrown from both synchronous and asynchronous operations, display user-friendly error messages, and manage loading states. The package works on iOS and macOS, starting from iOS 15 and macOS 12.

## Features

- **NnTryButton and NnAsyncTryButton**: SwiftUI buttons that catch and handle errors from synchronous and asynchronous actions.
- **NnDisplayableError**: A protocol that your custom error types can conform to, in order to customize the error title and message that will be displayed.
- **NnSwiftUIErrorHandler**: An environment object that catches and transforms errors into user-friendly alerts.
- **NnSwiftUIErrorHandlingViewModifier**: A view modifier that listens for changes in the NnSwiftUIErrorHandler and displays the error alerts on the current view.
- **NnLoadingHandler**: An environment object that manages loading states.
- **NnLoadingViewModifier**: A view modifier that displays a loading view on the current view while `isLoading` is true in the NnLoadingHandler.
- **NnAsyncTaskOnAppearViewModifier**: A view modifier that handles errors and loading state for async actions in a SwiftUI `.task` modifier.

## Usage

Import the package: 

`import NnSwiftUIErrorHandling`

Add `NnSwiftUIErrorHandlingViewModifier` and `NnLoadingViewModifier` in your App struct to enable error handling and loading state management:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withLoadingView()
                .withErrorHandling()
        }
    }
}
```

Use `NnTryButton` or `NnAsyncTryButton` in your views to handle methods that throw errors:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
        // each button should have access to environmentObjects passed from App struct
            NnTryButton("Press me", action: mayThrowError)
            
            NnAsyncTryButton("Press me", action: mayThrowErrorAsync)
        }
    }
    
    func mayThrowError() throws {
        // Some operation that may throw an error
    }
    
    func mayThrowErrorAsync() async throws {
        // Some async operation that may throw an error
    }
}
```

Use `NnAsyncTaskOnAppearViewModifier` to handle async throws methods in a `.task` block:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .asyncTask(mayThrowErrorAsync)
    }
    
    func mayThrowErrorAsync() async throws {
        // Some async operation that may throw an error
    }
}
```

To customize error messages, create custom error types that conform to `NnDisplayableError`:

```swift
struct CustomError: NnDisplayableError {
    var title: String { "Custom Error" }
    var message: String { "This is a custom error." }
}
```

## Installation

You can add `NnSwiftUIErrorHandling` to a Swift package as a dependency easily. Add the following to the dependencies of your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/nikolainobadi/NnSwiftUIErrorHandling.git", .upToNextMajor(from: "1.0.0"))
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["NnSwiftUIErrorHandling"]),
]
```

Or, in your Xcode project, go to `File > Swift Packages > Add Package Dependency...` and enter the package repository URL.

## Requirements

- iOS 15.0 or later
- macOS 12.0 or later
- Xcode 13.0 or later
- Swift 5.5 or later

## Acknowledgments

This Swift package was inspired by [this article](https://www.ralfebert.com/swiftui/generic-error-handling/) written by Ralf Ebert. A special thanks to the author for their ideas and guidance.


## License

`NnSwiftUIErrorHandling` is available under the MIT license. See the LICENSE file for more info.

