import SwiftUI

/// A ready-to-use frosted glass container view.
public struct GlassCard<Content: View>: View {
    public let cornerRadius: CGFloat
    public let tint: GlassTint
    public let content: () -> Content

    public init(
        cornerRadius: CGFloat = 16,
        tint: GlassTint = .frosted,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.tint = tint
        self.content = content
    }

    public var body: some View {
        content()
            .padding()
            .glassmorphism(cornerRadius: cornerRadius, tint: tint)
    }
}
