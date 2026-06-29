import SwiftUI

enum _YcPg5562Wv {
    static let voidBase = shade("14101C")
    static let sleeve = shade("211A30")
    static let sleeveRaised = shade("2C2440")

    static let gold = shade("E6B450")
    static let violet = shade("8A6FE8")
    static let neon = shade("FF6B9D")

    static let ink = shade("F5F0FF")
    static let inkSoft = shade("9A91B0")
    static let hairline = shade("FFFFFF").opacity(0.08)

    static let positive = shade("5BD6A6")
    static let alert = shade("FF7A6B")

    static var nightGradient: LinearGradient {
        LinearGradient(
            colors: [shade("1B1428"), voidBase, shade("0E0B16")],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    static var goldVioletSweep: LinearGradient {
        LinearGradient(
            colors: [gold, neon, violet],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static func shade(_ token: String) -> Color {
        var clean = token
        if clean.hasPrefix("#") { clean.removeFirst() }
        var packed: UInt64 = 0
        Scanner(string: clean).scanHexInt64(&packed)
        let r = Double((packed >> 16) & 0xFF) / 255
        let g = Double((packed >> 8) & 0xFF) / 255
        let b = Double(packed & 0xFF) / 255
        return Color(.sRGB, red: r, green: g, blue: b, opacity: 1)
    }
}
