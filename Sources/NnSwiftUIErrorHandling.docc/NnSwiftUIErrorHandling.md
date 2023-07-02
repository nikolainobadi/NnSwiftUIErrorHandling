# ``NnSwiftUIErrorHandling``

Welcome to the `NnSwiftUIErrorHandling` package. This package provides an easy and efficient way to handle errors in SwiftUI, both synchronously and asynchronously.

## Overview

The `NnSwiftUIErrorHandling` package provides essential components to handle and display errors that can occur in a SwiftUI app. It includes two primary views, `NnTryButton` and `NnAsyncTryButton`, which are designed to handle methods that throw errors. Both buttons catch the error and pass it to `NnSwiftUIErrorHandler`, which will present the error to the user if the `NnSwiftUIErrorHandlingViewModifier` is enabled.

The package also provides support for loading states with `NnLoadingHandler` and `NnLoadingViewModifier`, as well as handling of tasks that need to occur in a .task block of a view with `NnAsyncTaskOnAppearViewModifier`.

This package requires iOS 15.0 or later, macOS 12.0 or later, Xcode 13.0 or later, and Swift 5.5 or later.

## Topics

### Buttons
- ``NnTryButton``
- ``NnAsyncTryButton``

### Handlers
- ``NnLoadingHandler``
- ``NnSwiftUIErrorHandler``

### Other
- ``NnDisplayableError``

## See Also

- [Inspired by this blog article](https://www.ralfebert.com/swiftui/generic-error-handling/)

