import Foundation

enum _UeQj3346Pl {
    static func _xDl3100(_ raw: String) -> String? {
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }

        if let viaQuery = _xCp3101(#"(?:[?&])(?:barcode|ean|gtin|code)=(\d{8,14})"#, in: trimmed) {
            return viaQuery
        }

        let run = _xLn3102(trimmed)
        if let run, (8...14).contains(run.count) {
            return run
        }

        let bare = trimmed.filter(\.isNumber)
        if (8...14).contains(bare.count) { return bare }
        if bare.count > 14 { return String(bare.prefix(13)) }
        return run
    }

    private static func _xCp3101(_ pattern: String, in haystack: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return nil }
        let span = NSRange(haystack.startIndex..., in: haystack)
        guard
            let hit = regex.firstMatch(in: haystack, range: span),
            hit.numberOfRanges > 1,
            let r = Range(hit.range(at: 1), in: haystack)
        else { return nil }
        return String(haystack[r])
    }

    private static func _xLn3102(_ s: String) -> String? {
        var best = ""
        var run = ""
        for ch in s {
            if ch.isNumber {
                run.append(ch)
            } else {
                if run.count > best.count { best = run }
                run = ""
            }
        }
        if run.count > best.count { best = run }
        return best.isEmpty ? nil : best
    }
}
