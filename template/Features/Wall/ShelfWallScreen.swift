import SwiftUI

struct _CwTf0056Eg: View {
    @EnvironmentObject private var crate: _GpSw4468Mf
    @State private var focusId: UUID?

    private let grid = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        VStack(spacing: 0) {
            header
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
            Text("Shelf wall")
                .font(_TsJm9981Bq.display(28)).foregroundStyle(_YcPg5562Wv.ink)
            Text("Your sleeves, on display")
                .font(_TsJm9981Bq.liner(14)).foregroundStyle(_YcPg5562Wv.inkSoft)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
        .padding(.top, 28)
        .padding(.bottom, 14)
    }

    @ViewBuilder
    private var content: some View {
        if crate._xe1209.isEmpty {
            Spacer()
            StateNote(glyph: "rectangle.on.rectangle.slash", title: "Bare wall", message: "File a few records and they'll hang here as a cover-art mosaic.")
            Spacer()
        } else {
            ScrollView {
                LazyVGrid(columns: grid, spacing: 12) {
                    ForEach(crate._xe1209) { entry in
                        Button { focusId = entry.id } label: {
                            ZStack(alignment: .bottomLeading) {
                                _LhPm6601Ux(url: entry._p2._ra1)
                                LinearGradient(colors: [.clear, .black.opacity(0.7)], startPoint: .center, endPoint: .bottom)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(entry._p2._r2)
                                        .font(_TsJm9981Bq.label(13)).foregroundStyle(.white).lineLimit(1)
                                    Text(entry._p2._r3)
                                        .font(_TsJm9981Bq.mono(9)).foregroundStyle(_YcPg5562Wv.gold).lineLimit(1)
                                }
                                .padding(10)
                            }
                            .aspectRatio(1, contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: _HkFd3347Uc.tileRadius, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, 4)
                .padding(.bottom, 16)
            }
        }
    }
}
