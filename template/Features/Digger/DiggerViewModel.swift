import SwiftUI

@MainActor
final class _HvXt5578Ql: ObservableObject {
    enum Phase: Equatable {
        case _e1
        case _e2
        case _e3([_IqZv9912Oy])
        case _e4
        case _e5(String)
    }

    @Published var _xTm5100 = ""
    @Published private(set) var _xPh5101: Phase = ._e1

    private let _xDi5104: _JdWe9901Xc
    private var _xJb5105: Task<Void, Never>?

    init(discography: _JdWe9901Xc) {
        self._xDi5104 = discography
    }

    func _xRn5102() {
        _xJb5105?.cancel()
        let q = _xTm5100
        guard !q.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        _xJb5105 = Task {
            _xPh5101 = ._e2
            do {
                let hits = try await _xDi5104._xDg2100(term: q)
                if Task.isCancelled { return }
                _xPh5101 = hits.isEmpty ? ._e4 : ._e3(hits)
            } catch is CancellationError {
                return
            } catch {
                if Task.isCancelled { return }
                if case _ObNv5578Ig.emptyShelf = error {
                    _xPh5101 = ._e4
                } else {
                    _xPh5101 = ._e5(error.localizedDescription)
                }
            }
        }
    }

    func _xCl5103() {
        _xJb5105?.cancel()
        _xTm5100 = ""
        _xPh5101 = ._e1
    }
}
