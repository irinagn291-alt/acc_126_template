import Foundation
import Combine

@MainActor
final class _GpSw4468Mf: ObservableObject {
    @Published private(set) var _xe1209: [_MbPw5534Rt] = []

    private let vault: String = "vinora.crate.v1"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        _xe1209 = _xRv1211()
    }

    func _xSo1200(mbid: String) -> _GeNj7790Cs? {
        _xe1209.first { $0._p2._r1 == mbid }?._p3
    }

    func _xEo1201(on shelf: _GeNj7790Cs) -> [_MbPw5534Rt] {
        _xe1209.filter { $0._p3 == shelf }
    }

    @discardableResult
    func _xFl1202(_ release: _IqZv9912Oy, onto shelf: _GeNj7790Cs) -> _MbPw5534Rt {
        if let existing = _xe1209.first(where: { $0._p2._r1 == release._r1 }) {
            return existing
        }
        let entry = _MbPw5534Rt(release: release, shelf: shelf)
        _xe1209.insert(entry, at: 0)
        _xCt1210()
        return entry
    }

    func _xDs1203(_ entry: _MbPw5534Rt) {
        _xe1209.removeAll { $0.id == entry.id }
        _xCt1210()
    }

    func _xMv1204(_ entry: _MbPw5534Rt, to shelf: _GeNj7790Cs) {
        _xMt1209(entry) { $0._p3 = shelf }
    }

    func _xTp1205(_ entry: _MbPw5534Rt) {
        _xMt1209(entry) { $0._p4.toggle() }
    }

    func _xSs1206(_ entry: _MbPw5534Rt, to value: Int) {
        _xMt1209(entry) { $0._p5 = max(0, min(5, value)) }
    }

    func _xSg1207(_ entry: _MbPw5534Rt, to grade: _DsKm4467Wh) {
        _xMt1209(entry) { $0._p6 = grade }
    }

    func _xSm1208(_ entry: _MbPw5534Rt, to text: String) {
        _xMt1209(entry) { $0._p7 = text }
    }

    private func _xMt1209(_ entry: _MbPw5534Rt, _ change: (inout _MbPw5534Rt) -> Void) {
        guard let idx = _xe1209.firstIndex(where: { $0.id == entry.id }) else { return }
        change(&_xe1209[idx])
        _xCt1210()
    }

    private func _xCt1210() {
        guard let blob = try? JSONEncoder().encode(_xe1209) else { return }
        defaults.set(blob, forKey: vault)
    }

    private func _xRv1211() -> [_MbPw5534Rt] {
        guard
            let blob = defaults.data(forKey: vault),
            let decoded = try? JSONDecoder().decode([_MbPw5534Rt].self, from: blob)
        else { return [] }
        return decoded
    }
}
