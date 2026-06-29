import SwiftUI

struct _ZkSb3378Ny: View {
    enum Source: Identifiable {
        case _s1(_IqZv9912Oy)
        case _s2(UUID)

        var id: String {
            switch self {
            case ._s1(let r): return r._r1
            case ._s2(let id): return id.uuidString
            }
        }
    }

    let source: Source

    @EnvironmentObject private var crate: _GpSw4468Mf
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 22) {
                    switch source {
                    case ._s1(let release):
                        hero(release)
                        discoveryActions(release)
                    case ._s2(let id):
                        if let entry = crate._xe1209.first(where: { $0.id == id }) {
                            hero(entry._p2)
                            editor(entry)
                        } else {
                            StateNote(glyph: "trash", title: "Removed", message: "This record is no longer in your crate.")
                        }
                    }
                }
                .padding(22)
                .padding(.bottom, 30)
            }
        }
    }

    private func hero(_ release: _IqZv9912Oy) -> some View {
        VStack(spacing: 16) {
            _LhPm6601Ux(url: release._ra1, corner: _HkFd3347Uc.cardRadius)
                .frame(width: 200, height: 200)
                .shadow(color: .black.opacity(0.5), radius: 18, y: 10)

            VStack(spacing: 6) {
                Text(release._r2)
                    .font(_TsJm9981Bq.display(24))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(_YcPg5562Wv.ink)
                Text(release._r3.isEmpty ? "Unknown artist" : release._r3)
                    .font(_TsJm9981Bq.liner(16))
                    .foregroundStyle(_YcPg5562Wv.gold)
            }

            metaGrid(release)
        }
    }

    private func metaGrid(_ release: _IqZv9912Oy) -> some View {
        let pairs: [(String, String)] = [
            ("Label", release._r5 ?? "—"),
            ("Format", release._r6 ?? "—"),
            ("Country", release._r7 ?? "—"),
            ("Year", release._r4.map(String.init) ?? "—"),
            ("Tracks", release._r9.map(String.init) ?? "—"),
            ("Barcode", release._r8 ?? "—")
        ]
        return LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            ForEach(pairs, id: \.0) { pair in
                VStack(alignment: .leading, spacing: 3) {
                    Text(pair.0.uppercased())
                        .font(_TsJm9981Bq.mono(9)).tracking(1).foregroundStyle(_YcPg5562Wv.inkSoft)
                    Text(pair.1)
                        .font(_TsJm9981Bq.label(14)).foregroundStyle(_YcPg5562Wv.ink).lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .frosted(radius: _HkFd3347Uc.tileRadius)
            }
        }
    }

    private func discoveryActions(_ release: _IqZv9912Oy) -> some View {
        VStack(spacing: 12) {
            if let shelf = crate._xSo1200(mbid: release._r1) {
                Text("Already on your \(shelf == ._a1 ? "shelf" : "wishlist")")
                    .font(_TsJm9981Bq.liner(14)).foregroundStyle(_YcPg5562Wv.positive)
            }
            Button("File as owned") {
                crate._xFl1202(release, onto: ._a1); dismiss()
            }
            .buttonStyle(_VxCt7792Sk())

            Button("Add to wishlist") {
                crate._xFl1202(release, onto: ._a2); dismiss()
            }
            .buttonStyle(_VxCt7792Sk(filled: false))
        }
    }

    private func editor(_ entry: _MbPw5534Rt) -> some View {
        VStack(spacing: 18) {
            section("Spins") {
                HStack(spacing: 10) {
                    ForEach(1...5, id: \.self) { n in
                        Button { crate._xSs1206(entry, to: n == entry._p5 ? n - 1 : n) } label: {
                            Image(systemName: n <= entry._p5 ? "circle.fill" : "circle")
                                .font(.system(size: 24))
                                .foregroundStyle(n <= entry._p5 ? _YcPg5562Wv.gold : _YcPg5562Wv.inkSoft)
                        }
                    }
                    Spacer()
                }
            }

            section("Sleeve grade") {
                let cols = [GridItem(.adaptive(minimum: 100), spacing: 8)]
                LazyVGrid(columns: cols, alignment: .leading, spacing: 8) {
                    ForEach(_DsKm4467Wh.allCases) { grade in
                        Button { crate._xSg1207(entry, to: grade) } label: {
                            Text(grade.rawValue)
                                .font(_TsJm9981Bq.mono(11))
                                .foregroundStyle(entry._p6 == grade ? _YcPg5562Wv.voidBase : _YcPg5562Wv.ink)
                                .padding(.horizontal, 12).padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(Capsule().fill(entry._p6 == grade ? _YcPg5562Wv.violet : _YcPg5562Wv.sleeve.opacity(0.5)))
                        }
                    }
                }
            }

            section("Shelf") {
                HStack(spacing: 10) {
                    ForEach(_GeNj7790Cs.allCases) { shelf in
                        Button { crate._xMv1204(entry, to: shelf) } label: {
                            Label(shelf.caption, systemImage: shelf.glyph)
                                .font(_TsJm9981Bq.label(13))
                                .foregroundStyle(entry._p3 == shelf ? _YcPg5562Wv.voidBase : _YcPg5562Wv.ink)
                                .padding(.horizontal, 14).padding(.vertical, 10)
                                .background(Capsule().fill(entry._p3 == shelf ? _YcPg5562Wv.gold : _YcPg5562Wv.sleeve.opacity(0.5)))
                        }
                    }
                    Spacer()
                    Button { crate._xTp1205(entry) } label: {
                        Image(systemName: entry._p4 ? "pin.fill" : "pin")
                            .foregroundStyle(entry._p4 ? _YcPg5562Wv.violet : _YcPg5562Wv.inkSoft)
                            .padding(10)
                            .background(Circle().fill(_YcPg5562Wv.sleeve.opacity(0.5)))
                    }
                }
            }

            section("Memo") {
                TextField("", text: Binding(
                    get: { entry._p7 },
                    set: { crate._xSm1208(entry, to: $0) }
                ), prompt: Text("Pressing notes, where you found it…").foregroundStyle(_YcPg5562Wv.inkSoft), axis: .vertical)
                .font(_TsJm9981Bq.liner(14))
                .foregroundStyle(_YcPg5562Wv.ink)
                .lineLimit(2...5)
                .padding(12)
                .frosted(radius: _HkFd3347Uc.tileRadius)
            }

            Button(role: .destructive) {
                crate._xDs1203(entry); dismiss()
            } label: {
                Label("Remove from crate", systemImage: "trash")
                    .font(_TsJm9981Bq.label(15)).foregroundStyle(_YcPg5562Wv.alert)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(Capsule().strokeBorder(_YcPg5562Wv.alert.opacity(0.5), lineWidth: 1))
            }
        }
    }

    private func section<C: View>(_ title: String, @ViewBuilder _ content: () -> C) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title.uppercased())
                .font(_TsJm9981Bq.mono(11)).tracking(2).foregroundStyle(_YcPg5562Wv.inkSoft)
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
