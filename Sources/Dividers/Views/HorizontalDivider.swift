import SwiftUI


/// A visual element that can be used to horizontally separate content.
///
/// - Note: In [increased](https://developer.apple.com/documentation/swiftui/colorschemecontrast)
/// contrast mode, the line width will be set to a minimum value of `1.0`.
/// You can change this value by setting the environment value with a key
/// path `\.accessibleDividerMinimumLineWidth`.
@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
public struct HorizontalDivider<S>: View where S: ShapeStyle {
    @Environment(\.accessibleDividerMinimumLineWidth) private var minLineWidth
    @Environment(\.defaultDividerLineWidth) private var defaultDividerLineWidth
    @Environment(\.colorSchemeContrast) private var contrast
    
    private var lineWidth: CGFloat?
    private var style: S

    public init(_ style: S = .quaternary, lineWidth: CGFloat? = nil) {
        self.style = style
        self.lineWidth = lineWidth
    }
    
    public var body: some View {
        Rectangle()
            .fill(style)
            .frame(height: accessibleLineWidth)
    }
    
    private var accessibleLineWidth: CGFloat {
        if contrast == .increased {
            return max(minLineWidth, lineWidth ?? defaultDividerLineWidth)
        } else {
            return lineWidth ?? defaultDividerLineWidth
        }
    }
}
