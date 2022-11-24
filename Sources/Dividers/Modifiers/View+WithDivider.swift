import SwiftUI


extension View {
    /// Adds a divider on a specific edge with a specific style and line width
    /// in this view.
    ///
    /// The modifier will add a ``Dividers/HorizontalDivider`` on the top and bottom edges,
    /// and a ``Dividers/VerticalDivider``  on the leading and trailing edges.
    ///
    /// - Parameters:
    ///     - edge: an edge to add a divider to.
    ///     - style: a divider shape style.
    ///     - lineWidth: width of the divider line.
    @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
    public func divider<S>(
        at edge: Edge,
        style: S = .quaternary,
        lineWidth: CGFloat? = nil
    ) -> some View where S: ShapeStyle {
        modifier(WithDivider(
            at: edge,
            style: style,
            lineWidth: lineWidth
        ))
    }
}


/// Adds a divider on a specific edge with a specific style and line width in this view.
@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
private struct WithDivider<S>: ViewModifier where S: ShapeStyle {
    private var edge: Edge
    private var style: S
    private var lineWidth: CGFloat?

    init(at edge: Edge, style: S, lineWidth: CGFloat?) {
        self.edge = edge
        self.style = style
        self.lineWidth = lineWidth
    }
    
    func body(content: Content) -> some View {
        content.overlay(alignment: alignment, content: divider)
    }
    
    @ViewBuilder private func divider() -> some View {
        switch edge {
        case .top, .bottom:
            HorizontalDivider(style, lineWidth: lineWidth)
        case .leading, .trailing:
            VerticalDivider(style, lineWidth: lineWidth)
        }
    }
    
    private var alignment: Alignment {
        switch edge {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}
