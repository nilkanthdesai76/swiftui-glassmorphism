import SwiftUI

/// Preset stylistic tints for glassmorphic cards and surfaces.
public enum GlassTint: Sendable {
    case clear
    case frosted
    case sapphire
    case emerald
    case obsidian

    public var tintColor: Color {
        switch self {
        case .clear:
            return .clear
        case .frosted:
            return Color.white.opacity(0.12)
        case .sapphire:
            return Color.blue.opacity(0.15)
        case .emerald:
            return Color.green.opacity(0.12)
        case .obsidian:
            return Color.black.opacity(0.35)
        }
    }
}

/// Modifier that applies a layered frosted glass blur, border gradient highlight, and subtle shadow.
public struct GlassBackgroundModifier: ViewModifier {
    public let cornerRadius: CGFloat
    public let tint: GlassTint
    public let strokeWidth: CGFloat

    public init(
        cornerRadius: CGFloat = 16,
        tint: GlassTint = .frosted,
        strokeWidth: CGFloat = 1
    ) {
        self.cornerRadius = cornerRadius
        self.tint = tint
        self.strokeWidth = strokeWidth
    }

    public func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(tint.tintColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.4),
                                Color.white.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: strokeWidth
                    )
            )
            .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 6)
    }
}

public extension View {
    /// Applies glassmorphic styling to any SwiftUI view.
    func glassmorphism(
        cornerRadius: CGFloat = 16,
        tint: GlassTint = .frosted,
        strokeWidth: CGFloat = 1
    ) -> some View {
        self.modifier(
            GlassBackgroundModifier(
                cornerRadius: cornerRadius,
                tint: tint,
                strokeWidth: strokeWidth
            )
        )
    }
}
