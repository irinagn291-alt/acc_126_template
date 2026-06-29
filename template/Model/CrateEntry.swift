import Foundation

enum _GeNj7790Cs: String, Codable, CaseIterable, Identifiable {
    case _a1 = "owned"
    case _a2 = "wishlist"

    var id: String { rawValue }
    var caption: String { self == ._a1 ? "In the crate" : "On the hunt" }
    var glyph: String { self == ._a1 ? "square.stack.3d.up.fill" : "sparkles" }
}

enum _DsKm4467Wh: String, Codable, CaseIterable, Identifiable {
    case _c1 = "Mint"
    case _c2 = "Near Mint"
    case _c3 = "Played"
    case _c4 = "Worn"
    case _c5 = "Ungraded"

    var id: String { rawValue }
}

struct _MbPw5534Rt: Identifiable, Codable, Hashable {
    let id: UUID
    let _p2: _IqZv9912Oy
    var _p3: _GeNj7790Cs
    var _p4: Bool
    var _p5: Int
    var _p6: _DsKm4467Wh
    var _p7: String
    let _p8: Date

    enum CodingKeys: String, CodingKey {
        case id
        case _p2 = "release"
        case _p3 = "shelf"
        case _p4 = "pinned"
        case _p5 = "spins"
        case _p6 = "grade"
        case _p7 = "memo"
        case _p8 = "filedAt"
    }

    init(
        release: _IqZv9912Oy,
        shelf: _GeNj7790Cs = ._a1,
        pinned: Bool = false,
        spins: Int = 0,
        grade: _DsKm4467Wh = ._c5,
        memo: String = ""
    ) {
        self.id = UUID()
        self._p2 = release
        self._p3 = shelf
        self._p4 = pinned
        self._p5 = spins
        self._p6 = grade
        self._p7 = memo
        self._p8 = Date()
    }
}
