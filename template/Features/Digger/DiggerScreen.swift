import SwiftUI

struct _TcYg8801Mf: View {
    @EnvironmentObject private var hub: _BvKj4271Fx
    @EnvironmentObject private var crate: _GpSw4468Mf
    @StateObject private var model: _HvXt5578Ql
    @State private var focus: _IqZv9912Oy?

    init() {
        _model = StateObject(wrappedValue: _HvXt5578Ql(discography: _RhKy2235Tn()))
    }

    private let crumbs = ["Miles Davis", "Daft Punk", "Radiohead", "Nina Simone", "Tame Impala"]

    var body: some View {
        VStack(spacing: 0) {
            header
            searchField
            content(for: model._xPh5101)
        }
        .padding(.top, 8)
        .sheet(item: $focus) { release in
            _ZkSb3378Ny(source: ._s1(release))
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Dig the stacks")
                .font(_TsJm9981Bq.display(28))
                .foregroundStyle(_YcPg5562Wv.ink)
            Text("Search the global discography")
                .font(_TsJm9981Bq.liner(14))
                .foregroundStyle(_YcPg5562Wv.inkSoft)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
        .padding(.top, 28)
        .padding(.bottom, 14)
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(_YcPg5562Wv.inkSoft)
            TextField("", text: $model._xTm5100, prompt: Text("Artist, album, label…").foregroundStyle(_YcPg5562Wv.inkSoft))
                .font(_TsJm9981Bq.label(16))
                .foregroundStyle(_YcPg5562Wv.ink)
                .submitLabel(.search)
                .autocorrectionDisabled()
                .onSubmit { model._xRn5102() }
            if !model._xTm5100.isEmpty {
                Button { model._xCl5103() } label: {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(_YcPg5562Wv.inkSoft)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .frosted(radius: _HkFd3347Uc.pill)
        .padding(.horizontal, 22)
    }

    @ViewBuilder
    private func content(for phase: _HvXt5578Ql.Phase) -> some View {
        switch phase {
        case ._e1:
            suggestions
        case ._e2:
            Spacer()
            ProgressView().tint(_YcPg5562Wv.gold).scaleEffect(1.3)
            Spacer()
        case ._e3(let list):
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(list) { release in
                        Button { focus = release } label: {
                            _ReleaseRow(release: release, shelf: crate._xSo1200(mbid: release._r1))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, 16)
                .padding(.bottom, 16)
            }
        case ._e4:
            StateNote(glyph: "tray", title: "No pressings", message: "Nothing matched "\(model._xTm5100)". Try a different spelling or just the artist.")
            Spacer()
        case ._e5(let msg):
            StateNote(glyph: "wifi.exclamationmark", title: "Couldn't dig", message: msg)
            Spacer()
        }
    }

    private var suggestions: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("TRY A CRATE STAPLE")
                    .font(_TsJm9981Bq.mono(11))
                    .tracking(2)
                    .foregroundStyle(_YcPg5562Wv.inkSoft)
                    .padding(.top, 24)
                _FlowChips(items: crumbs) { pick in
                    model._xTm5100 = pick
                    model._xRn5102()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 22)
        }
    }
}

private struct _FlowChips: View {
    let items: [String]
    let onPick: (String) -> Void

    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 110), spacing: 10)]
        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
            ForEach(items, id: \.self) { item in
                Button { onPick(item) } label: {
                    Text(item)
                        .font(_TsJm9981Bq.label(14))
                        .foregroundStyle(_YcPg5562Wv.ink)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Capsule().fill(_YcPg5562Wv.sleeve.opacity(0.6)))
                        .overlay(Capsule().strokeBorder(_YcPg5562Wv.hairline, lineWidth: 1))
                }
            }
        }
    }
}
