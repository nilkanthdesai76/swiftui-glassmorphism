import XCTest
import SwiftUI
@testable import Glassmorphism

final class GlassmorphismTests: XCTestCase {
    func testGlassTintValues() {
        XCTAssertEqual(GlassTint.clear.tintColor, Color.clear)
        XCTAssertNotNil(GlassTint.frosted.tintColor)
        XCTAssertNotNil(GlassTint.sapphire.tintColor)
        XCTAssertNotNil(GlassTint.emerald.tintColor)
        XCTAssertNotNil(GlassTint.obsidian.tintColor)
    }

    func testGlassCardInitialization() {
        let card = GlassCard(cornerRadius: 20, tint: .sapphire) {
            Text("Test")
        }
        XCTAssertEqual(card.cornerRadius, 20)
        XCTAssertEqual(card.tint, .sapphire)
    }
}
