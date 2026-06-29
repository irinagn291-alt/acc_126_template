import SwiftUI

enum _TsJm9981Bq {
    static func display(_ size: CGFloat) -> Font {
        .system(size: size, weight: .heavy, design: .rounded)
    }

    static func title(_ size: CGFloat) -> Font {
        .system(size: size, weight: .bold, design: .rounded)
    }

    static func label(_ size: CGFloat) -> Font {
        .system(size: size, weight: .semibold, design: .rounded)
    }

    static func liner(_ size: CGFloat) -> Font {
        .system(size: size, weight: .regular, design: .serif)
    }

    static func mono(_ size: CGFloat) -> Font {
        .system(size: size, weight: .medium, design: .monospaced)
    }
}

enum _HkFd3347Uc {
    static let pill: CGFloat = 999
    static let cardRadius: CGFloat = 24
    static let tileRadius: CGFloat = 18
    static let gutter: CGFloat = 18
    static let dockHeight: CGFloat = 68
    static let dockClearance: CGFloat = dockHeight + 28
}
