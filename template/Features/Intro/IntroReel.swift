import SwiftUI

struct _WtVb7751Hg: View {
    @EnvironmentObject private var stage: _QmRt8834Lp

    @State private var discSpin = false
    @State private var armDrop = false
    @State private var labelGlow = false
    @State private var wordOffset: CGFloat = 24
    @State private var wordOpacity: Double = 0

    var body: some View {
        ZStack {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()
            haze

            VStack(spacing: 36) {
                Spacer()
                turntable
                wordmark
                Spacer()
                Text("CUE THE NEEDLE")
                    .font(_TsJm9981Bq.mono(11))
                    .tracking(3)
                    .foregroundStyle(_YcPg5562Wv.inkSoft)
                    .opacity(wordOpacity)
                    .padding(.bottom, 48)
            }
        }
        .onAppear(perform: _xRn0006)
    }

    private var turntable: some View {
        ZStack {
            Circle()
                .fill(_YcPg5562Wv.gold.opacity(labelGlow ? 0.22 : 0.05))
                .frame(width: 260, height: 260)
                .blur(radius: 40)

            Circle()
                .fill(
                    RadialGradient(
                        colors: [_YcPg5562Wv.sleeveRaised, .black],
                        center: .center, startRadius: 8, endRadius: 120
                    )
                )
                .frame(width: 210, height: 210)
                .overlay(grooves)
                .overlay(
                    Circle()
                        .fill(_YcPg5562Wv.goldVioletSweep)
                        .frame(width: 74, height: 74)
                        .overlay(Circle().fill(_YcPg5562Wv.voidBase).frame(width: 10, height: 10))
                )
                .rotationEffect(.degrees(discSpin ? 360 : 0))
                .animation(.linear(duration: 6).repeatForever(autoreverses: false), value: discSpin)

            tonearm
        }
        .frame(height: 280)
    }

    private var grooves: some View {
        ZStack {
            ForEach(1...7, id: \.self) { ring in
                Circle()
                    .strokeBorder(Color.white.opacity(0.04), lineWidth: 1)
                    .frame(width: CGFloat(ring) * 26, height: CGFloat(ring) * 26)
            }
        }
    }

    private var tonearm: some View {
        Capsule()
            .fill(_YcPg5562Wv.inkSoft)
            .frame(width: 96, height: 6)
            .overlay(Circle().fill(_YcPg5562Wv.neon).frame(width: 12, height: 12).offset(x: 44))
            .rotationEffect(.degrees(armDrop ? -18 : -55), anchor: .leading)
            .offset(x: 70, y: -70)
    }

    private var wordmark: some View {
        VStack(spacing: 6) {
            Text("VINORA")
                .font(_TsJm9981Bq.display(46))
                .tracking(4)
                .foregroundStyle(_YcPg5562Wv.ink)
            Text("crate-digging, pocket-sized")
                .font(_TsJm9981Bq.liner(15))
                .foregroundStyle(_YcPg5562Wv.gold)
        }
        .offset(y: wordOffset)
        .opacity(wordOpacity)
    }

    private var haze: some View {
        GeometryReader { geo in
            ForEach(0..<10, id: \.self) { i in
                Circle()
                    .fill(i.isMultiple(of: 2) ? _YcPg5562Wv.violet : _YcPg5562Wv.neon)
                    .frame(width: 4, height: 4)
                    .opacity(0.4)
                    .position(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: CGFloat.random(in: 0...geo.size.height)
                    )
                    .blur(radius: 1)
            }
        }
        .ignoresSafeArea()
    }

    private func _xRn0006() {
        discSpin = true
        withAnimation(.spring(response: 0.9, dampingFraction: 0.6).delay(0.2)) { armDrop = true }
        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) { labelGlow = true }
        withAnimation(.easeOut(duration: 0.7).delay(0.6)) {
            wordOffset = 0
            wordOpacity = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
            stage._xfK6700()
        }
    }
}
