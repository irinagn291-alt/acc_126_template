import SwiftUI

@MainActor
final class _OaFr9923Dv: ObservableObject {
    enum Outcome: Equatable {
        case _o1
        case _o2(String)
        case _o3([_IqZv9912Oy])
        case _o4(String)
    }

    @Published private(set) var _xOt5200: Outcome = ._o1
    @Published var _xTh5201 = false

    private let _xDi5204: _JdWe9901Xc
    private var _xLc5205: String?

    init(discography: _JdWe9901Xc) {
        self._xDi5204 = discography
    }

    func _xIg5202(_ raw: String) {
        guard let code = _UeQj3346Pl._xDl3100(raw), code != _xLc5205 else { return }
        _xLc5205 = code

        Task {
            _xOt5200 = ._o2(code)
            do {
                let hits = try await _xDi5204._xMb2101(code)
                _xOt5200 = ._o3(hits)
            } catch {
                _xOt5200 = ._o4(code)
            }
        }
    }

    func _xRa5203() {
        _xLc5205 = nil
        _xOt5200 = ._o1
    }
}
