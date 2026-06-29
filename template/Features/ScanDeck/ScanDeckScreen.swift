import SwiftUI

struct _JnWe2245Bk: View {
    @EnvironmentObject private var crate: _GpSw4468Mf
    @StateObject private var model = _OaFr9923Dv(discography: _RhKy2235Tn())
    @State private var focus: _IqZv9912Oy?

    var body: some View {
        ZStack {
            if _BnLr0089Zy.ready {
                _XfAm8812Dw { payload in model._xIg5202(payload) }
                    .ignoresSafeArea()
                reticle
                resultDrawer
            } else {
                StateNote(
                    glyph: "camera.metering.unknown",
                    title: "No camera here",
                    message: "Barcode scanning needs a device camera. Dig by name instead."
                )
            }
        }
        .sheet(item: $focus) { release in
            _ZkSb3378Ny(source: ._s1(release))
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    private var reticle: some View {
        VStack {
            Text("Center the sleeve barcode")
                .font(_TsJm9981Bq.label(15))
                .foregroundStyle(.white)
                .padding(.horizontal, 16).padding(.vertical, 10)
                .background(Capsule().fill(.black.opacity(0.5)))
                .padding(.top, 70)

            Spacer()

            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .strokeBorder(_YcPg5562Wv.gold, lineWidth: 3)
                .frame(width: 260, height: 150)
                .shadow(color: _YcPg5562Wv.gold.opacity(0.6), radius: 12)

            Spacer()
        }
    }

    @ViewBuilder
    private var resultDrawer: some View {
        switch model._xOt5200 {
        case ._o1:
            EmptyView()
        case ._o2(let code):
            drawer {
                HStack(spacing: 12) {
                    ProgressView().tint(_YcPg5562Wv.gold)
                    Text("Matching \(code)…")
                        .font(_TsJm9981Bq.label(15))
                        .foregroundStyle(_YcPg5562Wv.ink)
                }
            }
        case ._o3(let hits):
            drawer {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Found \(hits.count) pressing\(hits.count == 1 ? "" : "s")")
                        .font(_TsJm9981Bq.title(16)).foregroundStyle(_YcPg5562Wv.ink)
                    ForEach(hits.prefix(3)) { release in
                        Button { focus = release } label: {
                            _ReleaseRow(release: release, shelf: crate._xSo1200(mbid: release._r1))
                        }
                        .buttonStyle(.plain)
                    }
                    Button("Scan another") { model._xRa5203() }
                        .buttonStyle(_VxCt7792Sk(filled: false))
                }
            }
        case ._o4(let code):
            drawer {
                VStack(spacing: 12) {
                    StateNote(glyph: "barcode", title: "Unknown barcode", message: "We couldn't find \(code) in the discography.")
                    Button("Try again") { model._xRa5203() }
                        .buttonStyle(_VxCt7792Sk())
                }
            }
        }
    }

    private func drawer<C: View>(@ViewBuilder _ content: () -> C) -> some View {
        VStack {
            Spacer()
            content()
                .padding(18)
                .frosted(glow: true)
                .padding(.horizontal, 18)
                .padding(.bottom, 18)
                .transition(.move(edge: .bottom).combined(with: .opacity))
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: model._xOt5200)
    }
}
