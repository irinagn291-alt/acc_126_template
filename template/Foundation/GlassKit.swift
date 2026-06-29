import SwiftUI

struct _ZrMn6624Ey<Content: View>: View {
    var radius: CGFloat = _HkFd3347Uc.cardRadius
    var glow: Bool = false
    @ViewBuilder var content: Content

    var body: some View {
        content
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .fill(_YcPg5562Wv.sleeve.opacity(0.55))
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .opacity(0.35)
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(_YcPg5562Wv.hairline, lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.45), radius: glow ? 24 : 14, x: 0, y: glow ? 12 : 8)
    }
}

extension View {
    func frosted(radius: CGFloat = _HkFd3347Uc.cardRadius, glow: Bool = false) -> some View {
        _ZrMn6624Ey(radius: radius, glow: glow) { self }
    }
}

struct _LqAb0013Rj: View {
    let text: String
    var tint: Color = _YcPg5562Wv.violet

    var body: some View {
        Text(text.uppercased())
            .font(_TsJm9981Bq.mono(10))
            .tracking(0.8)
            .foregroundStyle(tint)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                Capsule().fill(tint.opacity(0.16))
            )
            .overlay(
                Capsule().strokeBorder(tint.opacity(0.4), lineWidth: 0.8)
            )
    }
}

struct _VxCt7792Sk: ButtonStyle {
    var filled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(_TsJm9981Bq.title(17))
            .foregroundStyle(filled ? _YcPg5562Wv.voidBase : _YcPg5562Wv.ink)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                Group {
                    if filled {
                        Capsule().fill(_YcPg5562Wv.goldVioletSweep)
                    } else {
                        Capsule().strokeBorder(_YcPg5562Wv.hairline, lineWidth: 1)
                            .background(Capsule().fill(_YcPg5562Wv.sleeve.opacity(0.5)))
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
