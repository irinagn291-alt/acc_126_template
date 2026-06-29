import SwiftUI

struct _PmEg6673Nw: View {
    @State private var dock: _KrTf3340Av = ._d1
    @State private var showPrefs = false

    var body: some View {
        ZStack(alignment: .bottom) {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()

            current
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    Color.clear.frame(height: _HkFd3347Uc.dockClearance)
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.2), value: dock)

            _StHp8817Xu(selection: $dock)
                .padding(.horizontal, 22)
                .padding(.bottom, 14)
        }
        .overlay(alignment: .topTrailing) { prefsButton }
        .sheet(isPresented: $showPrefs) {
            _MdVp7734Rq()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    @ViewBuilder
    private var current: some View {
        switch dock {
        case ._d1: _TcYg8801Mf()
        case ._d2: _JnWe2245Bk()
        case ._d3: _FlRb1134Ep()
        case ._d4: _CwTf0056Eg()
        }
    }

    private var prefsButton: some View {
        Button { showPrefs = true } label: {
            Image(systemName: "gearshape.fill")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(_YcPg5562Wv.ink)
                .padding(11)
                .background(Circle().fill(_YcPg5562Wv.sleeve.opacity(0.7)))
                .overlay(Circle().strokeBorder(_YcPg5562Wv.hairline, lineWidth: 1))
        }
        .padding(.trailing, 20)
        .padding(.top, 8)
    }
}

enum _KrTf3340Av: CaseIterable {
    case _d1, _d2, _d3, _d4

    var glyph: String {
        switch self {
        case ._d1: return "magnifyingglass"
        case ._d2: return "barcode.viewfinder"
        case ._d3: return "square.stack.3d.up.fill"
        case ._d4: return "rectangle.grid.3x2.fill"
        }
    }

    var caption: String {
        switch self {
        case ._d1: return "Dig"
        case ._d2: return "Scan"
        case ._d3: return "Crate"
        case ._d4: return "Wall"
        }
    }
}

private struct _StHp8817Xu: View {
    @Binding var selection: _KrTf3340Av

    var body: some View {
        HStack(spacing: 4) {
            ForEach(_KrTf3340Av.allCases, id: \.self) { tab in
                let active = tab == selection
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) { selection = tab }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.glyph)
                            .font(.system(size: 18, weight: .semibold))
                        Text(tab.caption)
                            .font(_TsJm9981Bq.mono(9))
                            .tracking(0.5)
                    }
                    .foregroundStyle(active ? _YcPg5562Wv.voidBase : _YcPg5562Wv.inkSoft)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(active ? AnyShapeStyle(_YcPg5562Wv.goldVioletSweep) : AnyShapeStyle(Color.clear))
                    )
                }
            }
        }
        .padding(6)
        .frame(height: _HkFd3347Uc.dockHeight)
        .frosted(radius: _HkFd3347Uc.pill, glow: true)
    }
}
