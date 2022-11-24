import SwiftUI


private struct DefaultDividerLineWidthKey: EnvironmentKey {
    static var defaultValue: CGFloat = 1.0
}


extension EnvironmentValues {
    /// Definds the default width of any divider line in the ascending hierarchy of views.
    ///
    /// Default value is `1.0`.
    @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
    public var defaultDividerLineWidth: CGFloat {
        get { self[DefaultDividerLineWidthKey.self] }
        set { self[DefaultDividerLineWidthKey.self] = newValue }
    }
}

