import SwiftUI

struct _LhPm6601Ux: View {
    let url: URL?
    var corner: CGFloat = _HkFd3347Uc.tileRadius

    var body: some View {
        AsyncImage(url: url, transaction: Transaction(animation: .easeIn(duration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.resizable().scaledToFill().clipped()
            default:
                placeholder
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: corner, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: corner, style: .continuous)
                .strokeBorder(_YcPg5562Wv.hairline, lineWidth: 1)
        )
    }

    private var placeholder: some View {
        ZStack {
            RoundedRectangle(cornerRadius: corner, style: .continuous)
                .fill(_YcPg5562Wv.sleeveRaised)
            Image(systemName: "opticaldisc")
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(_YcPg5562Wv.inkSoft.opacity(0.6))
        }
    }
}

struct _ReleaseRow: View {
    let release: _IqZv9912Oy
    var shelf: _GeNj7790Cs?

    var body: some View {
        HStack(spacing: 14) {
            _LhPm6601Ux(url: release._ra2)
                .frame(width: 60, height: 60)

            VStack(alignment: .leading, spacing: 4) {
                Text(release._r2)
                    .font(_TsJm9981Bq.title(16))
                    .foregroundStyle(_YcPg5562Wv.ink)
                    .lineLimit(1)
                Text(release._r3.isEmpty ? "Unknown artist" : release._r3)
                    .font(_TsJm9981Bq.liner(13))
                    .foregroundStyle(_YcPg5562Wv.gold)
                    .lineLimit(1)
                if !release._ra4.isEmpty {
                    Text(release._ra4)
                        .font(_TsJm9981Bq.mono(10))
                        .foregroundStyle(_YcPg5562Wv.inkSoft)
                        .lineLimit(1)
                }
            }

            Spacer(minLength: 4)

            if let shelf {
                Image(systemName: shelf.glyph)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(shelf == ._a1 ? _YcPg5562Wv.positive : _YcPg5562Wv.neon)
            } else {
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(_YcPg5562Wv.inkSoft)
            }
        }
        .padding(12)
        .frosted()
    }
}

struct StateNote: View {
    let glyph: String
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: glyph)
                .font(.system(size: 44, weight: .regular))
                .foregroundStyle(_YcPg5562Wv.inkSoft)
            Text(title)
                .font(_TsJm9981Bq.title(19))
                .foregroundStyle(_YcPg5562Wv.ink)
            Text(message)
                .font(_TsJm9981Bq.liner(14))
                .multilineTextAlignment(.center)
                .foregroundStyle(_YcPg5562Wv.inkSoft)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}
