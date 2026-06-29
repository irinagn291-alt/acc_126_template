import SwiftUI

struct _FlRb1134Ep: View {
    @EnvironmentObject private var crate: _GpSw4468Mf
    @State private var lens: _Lens = ._l1
    @State private var order: _Order = ._o1
    @State private var focusId: UUID?

    private enum _Lens: String, CaseIterable { case _l1 = "All", _l2 = "Owned", _l3 = "Wishlist" }
    private enum _Order: String, CaseIterable { case _o1 = "Recent", _o2 = "Artist", _o3 = "Spins" }

    var body: some View {
        VStack(spacing: 0) {
            header
            lensBar
            content
        }
        .padding(.top, 8)
        .sheet(item: Binding(
            get: { focusId.flatMap { id in crate._xe1209.first { $0.id == id } } },
            set: { focusId = $0?.id }
        )) { entry in
            _ZkSb3378Ny(source: ._s2(entry.id))
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Your crate")
                .font(_TsJm9981Bq.display(28))
                .foregroundStyle(_YcPg5562Wv.ink)
            Text("\(crate._xe1209.count) record\(crate._xe1209.count == 1 ? "" : "s") filed")
                .font(_TsJm9981Bq.liner(14))
                .foregroundStyle(_YcPg5562Wv.inkSoft)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
        .padding(.top, 28)
        .padding(.bottom, 12)
    }

    private var lensBar: some View {
        VStack(spacing: 10) {
            Picker("", selection: $lens) {
                ForEach(_Lens.allCases, id: \.self) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)

            HStack(spacing: 8) {
                Text("Sort")
                    .font(_TsJm9981Bq.mono(11)).foregroundStyle(_YcPg5562Wv.inkSoft)
                ForEach(_Order.allCases, id: \.self) { opt in
                    Button { order = opt } label: {
                        Text(opt.rawValue)
                            .font(_TsJm9981Bq.mono(11))
                            .foregroundStyle(order == opt ? _YcPg5562Wv.voidBase : _YcPg5562Wv.inkSoft)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(Capsule().fill(order == opt ? _YcPg5562Wv.gold : _YcPg5562Wv.sleeve.opacity(0.5)))
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal, 22)
        .padding(.bottom, 10)
    }

    @ViewBuilder
    private var content: some View {
        let rows = filtered
        if rows.isEmpty {
            Spacer()
            StateNote(glyph: "square.stack.3d.up.slash", title: "Crate's empty", message: "Scan a sleeve or dig the stacks to file your first pressing.")
            Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(rows) { entry in
                        Button { focusId = entry.id } label: {
                            _CrateRow(entry: entry)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, 6)
                .padding(.bottom, 16)
            }
        }
    }

    private var filtered: [_MbPw5534Rt] {
        var rows = crate._xe1209
        switch lens {
        case ._l1: break
        case ._l2: rows = rows.filter { $0._p3 == ._a1 }
        case ._l3: rows = rows.filter { $0._p3 == ._a2 }
        }
        switch order {
        case ._o1: rows.sort { $0._p8 > $1._p8 }
        case ._o2: rows.sort { $0._p2._r3.localizedCaseInsensitiveCompare($1._p2._r3) == .orderedAscending }
        case ._o3: rows.sort { $0._p5 > $1._p5 }
        }
        return rows.sorted { $0._p4 && !$1._p4 }
    }
}

private struct _CrateRow: View {
    let entry: _MbPw5534Rt

    var body: some View {
        HStack(spacing: 14) {
            _LhPm6601Ux(url: entry._p2._ra2)
                .frame(width: 62, height: 62)

            VStack(alignment: .leading, spacing: 5) {
                Text(entry._p2._r2)
                    .font(_TsJm9981Bq.title(16)).foregroundStyle(_YcPg5562Wv.ink).lineLimit(1)
                Text(entry._p2._r3.isEmpty ? "Unknown artist" : entry._p2._r3)
                    .font(_TsJm9981Bq.liner(13)).foregroundStyle(_YcPg5562Wv.gold).lineLimit(1)
                HStack(spacing: 6) {
                    _LqAb0013Rj(text: entry._p3 == ._a1 ? "Owned" : "Wishlist",
                             tint: entry._p3 == ._a1 ? _YcPg5562Wv.positive : _YcPg5562Wv.neon)
                    if entry._p5 > 0 {
                        _LqAb0013Rj(text: "\(entry._p5)★", tint: _YcPg5562Wv.gold)
                    }
                }
            }
            Spacer(minLength: 4)
            if entry._p4 {
                Image(systemName: "pin.fill")
                    .font(.system(size: 12)).foregroundStyle(_YcPg5562Wv.violet)
            }
        }
        .padding(12)
        .frosted()
    }
}
