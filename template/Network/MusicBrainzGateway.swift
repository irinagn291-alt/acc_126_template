import Foundation

private enum _Str {
    static func _r(_ b: String) -> String {
        String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
    }
}

enum _ObNv5578Ig: LocalizedError {
    case malformedQuery
    case transport
    case emptyShelf

    var errorDescription: String? {
        switch self {
        case .malformedQuery: return _Str._r("VGhhdCBzZWFyY2ggZG9lc24ndCBsb29rIHJpZ2h0Lg==")
        case .transport: return _Str._r("VGhlIHJlY29yZCBzaG9wIGlzIG9mZmxpbmUgcmlnaHQgbm93Lg==")
        case .emptyShelf: return _Str._r("Tm8gcHJlc3NpbmdzIG1hdGNoZWQu")
        }
    }
}

protocol _JdWe9901Xc: Sendable {
    func _xDg2100(term: String) async throws -> [_IqZv9912Oy]
    func _xMb2101(_ code: String) async throws -> [_IqZv9912Oy]
}

final class _RhKy2235Tn: _JdWe9901Xc, Sendable {
    private var _xRt2200: String { _Str._r("aHR0cHM6Ly9tdXNpY2JyYWluei5vcmcvd3MvMg==") }
    private var _xAg2201: String { _Str._r("Vmlub3JhQ3JhdGUvMS4wICggaHR0cHM6Ly92aW5vcmEuYXBwICk=") }
    private let _xSe2200: URLSession

    init(session: URLSession = .shared) {
        self._xSe2200 = session
    }

    func _xDg2100(term: String) async throws -> [_IqZv9912Oy] {
        let trimmed = term.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { throw _ObNv5578Ig.malformedQuery }
        return try await _xQr2102(luceneFor: trimmed)
    }

    func _xMb2101(_ code: String) async throws -> [_IqZv9912Oy] {
        let digits = code.filter(\.isNumber)
        guard digits.count >= 8 else { throw _ObNv5578Ig.malformedQuery }
        return try await _xQr2102(luceneFor: "barcode:\(digits)")
    }

    private func _xQr2102(luceneFor expression: String) async throws -> [_IqZv9912Oy] {
        guard var comps = URLComponents(string: "\(_xRt2200)/release") else {
            throw _ObNv5578Ig.transport
        }
        comps.queryItems = [
            URLQueryItem(name: "query", value: expression),
            URLQueryItem(name: "fmt", value: "json"),
            URLQueryItem(name: "limit", value: "24")
        ]
        guard let url = comps.url else { throw _ObNv5578Ig.transport }

        let payload = try await _xFt2103(url)
        let decoded = try JSONDecoder().decode(_WS.self, from: payload)
        let mapped = decoded.releases.map(Self._xFd2104)
        if mapped.isEmpty { throw _ObNv5578Ig.emptyShelf }
        return mapped
    }

    private func _xFt2103(_ url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.setValue(_xAg2201, forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        guard
            let (data, response) = try? await _xSe2200.data(for: request),
            let http = response as? HTTPURLResponse,
            (200..<300).contains(http.statusCode)
        else {
            throw _ObNv5578Ig.transport
        }
        return data
    }

    private static func _xFd2104(_ wire: _WR) -> _IqZv9912Oy {
        let artist = (wire.artistCredit ?? [])
            .map { $0.name }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespaces)

        let year = wire.date
            .flatMap { $0.split(separator: "-").first }
            .flatMap { Int($0) }

        let medium = wire.media?.first
        return _IqZv9912Oy(
            _r1: wire.id,
            _r2: wire.title,
            _r3: artist,
            _r4: year,
            _r5: wire.labelInfo?.compactMap { $0.label?.name }.first,
            _r6: medium?.format,
            _r7: wire.country,
            _r8: wire.barcode,
            _r9: medium?.trackCount,
            _r10: wire.disambiguation?.isEmpty == false ? wire.disambiguation : nil
        )
    }
}

private struct _WS: Decodable {
    let releases: [_WR]
}

private struct _WR: Decodable {
    let id: String
    let title: String
    let date: String?
    let country: String?
    let barcode: String?
    let disambiguation: String?
    let artistCredit: [_WC]?
    let labelInfo: [_WLI]?
    let media: [_WM]?

    enum CodingKeys: String, CodingKey {
        case id, title, date, country, barcode, disambiguation, media
        case artistCredit = "artist-credit"
        case labelInfo = "label-info"
    }
}

private struct _WC: Decodable {
    let name: String
}

private struct _WLI: Decodable {
    let label: _WL?
}

private struct _WL: Decodable {
    let name: String?
}

private struct _WM: Decodable {
    let format: String?
    let trackCount: Int?

    enum CodingKeys: String, CodingKey {
        case format
        case trackCount = "track-count"
    }
}
