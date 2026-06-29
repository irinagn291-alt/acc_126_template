import SwiftUI

enum _NwZx1153Dh {
    case cueing
    case linerNotes
    case spinning
}

@MainActor
final class _QmRt8834Lp: ObservableObject {
    @Published var _xs6702: _NwZx1153Dh = .cueing
    @AppStorage("vinora.linerNotesSeen") private var _xLn0011 = false

    func _xfK6700() {
        _xAd0012(to: _xLn0011 ? .spinning : .linerNotes)
    }

    func _xfN6701() {
        _xLn0011 = true
        _xAd0012(to: .spinning)
    }

    private func _xAd0012(to next: _NwZx1153Dh) {
        withAnimation(.easeInOut(duration: 0.55)) { _xs6702 = next }
    }
}
