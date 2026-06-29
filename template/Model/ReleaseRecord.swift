import Foundation

private enum _Str {
    static func _r(_ b: String) -> String {
        String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
    }
}

struct _IqZv9912Oy: Identifiable, Codable, Hashable {
    let _r1: String
    let _r2: String
    let _r3: String
    let _r4: Int?
    let _r5: String?
    let _r6: String?
    let _r7: String?
    let _r8: String?
    let _r9: Int?
    let _r10: String?

    var id: String { _r1 }

    enum CodingKeys: String, CodingKey {
        case _r1 = "mbid"
        case _r2 = "title"
        case _r3 = "artist"
        case _r4 = "year"
        case _r5 = "label"
        case _r6 = "pressing"
        case _r7 = "territory"
        case _r8 = "barcode"
        case _r9 = "trackTally"
        case _r10 = "footnote"
    }

    private static let _cb: String = _Str._r("aHR0cHM6Ly9jb3ZlcmFydGFyY2hpdmUub3JnL3JlbGVhc2Uv")

    var _ra1: URL? {
        URL(string: Self._cb + "\(_r1)/front-500")
    }

    var _ra2: URL? {
        URL(string: Self._cb + "\(_r1)/front-250")
    }

    var _ra3: String {
        _r3.isEmpty ? _r2 : "\(_r3) — \(_r2)"
    }

    var _ra4: String {
        [_r6, _r7, _r4.map(String.init)]
            .compactMap { $0 }
            .joined(separator: " · ")
    }
}
