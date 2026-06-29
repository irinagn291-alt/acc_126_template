import SwiftUI
import AVFoundation

struct _CiYk4428Mq: View {
    @EnvironmentObject private var stage: _QmRt8834Lp
    @State private var panel = 0

    private let notes: [_FoSd1195Jb] = [
        _FoSd1195Jb(
            chip: "SIDE A · TRACK 1",
            glyph: "circle.grid.cross.fill",
            title: "Every pressing you love, one crate.",
            body: "Vinora keeps the records you own and the ones you're hunting in a single dark, glassy shelf."
        ),
        _FoSd1195Jb(
            chip: "SIDE A · TRACK 2",
            glyph: "barcode.viewfinder",
            title: "Point at the barcode.",
            body: "Flip a sleeve over, scan the strip, and we pull the exact pressing — label, country, format and all."
        ),
        _FoSd1195Jb(
            chip: "SIDE A · TRACK 3",
            glyph: "magnifyingglass",
            title: "Dig by artist or title.",
            body: "No barcode? Search the global discography and file the right release in two taps."
        ),
        _FoSd1195Jb(
            chip: "SIDE B · TRACK 1",
            glyph: "slider.horizontal.3",
            title: "Grade it, rate the spins.",
            body: "Mark sleeve condition, count your spins and leave a memo only a true collector would write."
        )
    ]

    var body: some View {
        ZStack {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()

            VStack(spacing: 0) {
                skip
                TabView(selection: $panel) {
                    ForEach(Array(notes.enumerated()), id: \.offset) { idx, note in
                        notePanel(note).tag(idx)
                    }
                    permissionPanel.tag(notes.count)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: panel)

                dots
                advanceButton
                    .padding(.horizontal, 28)
                    .padding(.bottom, 40)
            }
        }
    }

    private var skip: some View {
        HStack {
            Spacer()
            Button("Skip") { stage._xfN6701() }
                .font(_TsJm9981Bq.label(15))
                .foregroundStyle(_YcPg5562Wv.inkSoft)
                .padding(.trailing, 24)
                .padding(.top, 12)
                .opacity(panel == notes.count ? 0 : 1)
        }
    }

    private func notePanel(_ note: _FoSd1195Jb) -> some View {
        VStack(spacing: 28) {
            Spacer()
            ZStack {
                Circle()
                    .fill(_YcPg5562Wv.goldVioletSweep)
                    .frame(width: 150, height: 150)
                    .opacity(0.18)
                    .blur(radius: 12)
                Image(systemName: note.glyph)
                    .font(.system(size: 62, weight: .bold))
                    .foregroundStyle(_YcPg5562Wv.gold)
            }
            VStack(spacing: 14) {
                _LqAb0013Rj(text: note.chip, tint: _YcPg5562Wv.neon)
                Text(note.title)
                    .font(_TsJm9981Bq.title(28))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(_YcPg5562Wv.ink)
                Text(note.body)
                    .font(_TsJm9981Bq.liner(16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(_YcPg5562Wv.inkSoft)
                    .lineSpacing(4)
            }
            .padding(.horizontal, 34)
            Spacer()
        }
    }

    private var permissionPanel: some View {
        VStack(spacing: 26) {
            Spacer()
            Image(systemName: "camera.aperture")
                .font(.system(size: 66, weight: .bold))
                .foregroundStyle(_YcPg5562Wv.violet)
            VStack(spacing: 12) {
                _LqAb0013Rj(text: "SIDE B · TRACK 2", tint: _YcPg5562Wv.gold)
                Text("Let the needle see.")
                    .font(_TsJm9981Bq.title(28))
                    .foregroundStyle(_YcPg5562Wv.ink)
                Text("Vinora uses the camera only to read barcodes off your sleeves. Nothing is recorded or uploaded.")
                    .font(_TsJm9981Bq.liner(16))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(_YcPg5562Wv.inkSoft)
                    .lineSpacing(4)
                    .padding(.horizontal, 34)
            }
            Spacer()
        }
    }

    private var dots: some View {
        HStack(spacing: 8) {
            ForEach(0...notes.count, id: \.self) { idx in
                Capsule()
                    .fill(idx == panel ? _YcPg5562Wv.gold : _YcPg5562Wv.inkSoft.opacity(0.3))
                    .frame(width: idx == panel ? 22 : 7, height: 7)
                    .animation(.spring(response: 0.3), value: panel)
            }
        }
        .padding(.bottom, 20)
    }

    @ViewBuilder
    private var advanceButton: some View {
        if panel == notes.count {
            Button("Open the crate") {
                AVCaptureDevice.requestAccess(for: .video) { _ in
                    DispatchQueue.main.async { stage._xfN6701() }
                }
            }
            .buttonStyle(_VxCt7792Sk())
        } else {
            Button("Next") {
                withAnimation { panel += 1 }
            }
            .buttonStyle(_VxCt7792Sk(filled: false))
        }
    }
}

private struct _FoSd1195Jb {
    let chip: String
    let glyph: String
    let title: String
    let body: String
}
