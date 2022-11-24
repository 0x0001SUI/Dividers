import SwiftUI


private struct AccessibilityIncreasedContrastMinimumDividerLineWidthKey: EnvironmentKey {
    static var defaultValue: CGFloat = 1.0
}


extension EnvironmentValues {
    /// Definds the minimum width of any divider line in the ascending hierarchy of views in
    /// [increased](https://developer.apple.com/documentation/swiftui/colorschemecontrast)
    /// contrast mode.
    ///
    /// Default value is `1.0`.
    @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
    public var accessibleDividerMinimumLineWidth: CGFloat {
        get { self[AccessibilityIncreasedContrastMinimumDividerLineWidthKey.self] }
        set { self[AccessibilityIncreasedContrastMinimumDividerLineWidthKey.self] = newValue }
    }
}
