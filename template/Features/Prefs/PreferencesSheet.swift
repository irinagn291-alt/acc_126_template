import SwiftUI
import StoreKit

struct _MdVp7734Rq: View {
    @EnvironmentObject private var crate: _GpSw4468Mf
    @Environment(\.requestReview) private var requestReview
    @Environment(\.dismiss) private var dismiss
    @State private var web: _WebDest?

    var body: some View {
        ZStack {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    crest
                    stats
                    group("SUPPORT") {
                        row("envelope.fill", "Get in touch", _YcPg5562Wv.violet) { web = .contact }
                        divider
                        row("star.fill", "Rate Vinora", _YcPg5562Wv.gold) { requestReview() }
                    }
                    group("LEGAL") {
                        row("checkerboard.shield", "Privacy policy", _YcPg5562Wv.neon) { web = .privacy }
                    }
                    about
                }
                .padding(22)
                .padding(.bottom, 30)
            }
        }
        .sheet(item: $web) { dest in
            _ByJm4412Ws(title: dest.title, address: dest.address)
        }
    }

    private var crest: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle().fill(_YcPg5562Wv.goldVioletSweep).frame(width: 76, height: 76)
                Image(systemName: "opticaldisc.fill")
                    .font(.system(size: 34, weight: .bold)).foregroundStyle(_YcPg5562Wv.voidBase)
            }
            Text("Vinora").font(_TsJm9981Bq.display(24)).foregroundStyle(_YcPg5562Wv.ink)
            Text("Version 1.0").font(_TsJm9981Bq.mono(11)).foregroundStyle(_YcPg5562Wv.inkSoft)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 18)
        .frosted()
    }

    private var stats: some View {
        HStack(spacing: 12) {
            stat("\(crate._xEo1201(on: ._a1).count)", "Owned")
            stat("\(crate._xEo1201(on: ._a2).count)", "Wishlist")
            stat("\(crate._xe1209.filter { $0._p4 }.count)", "Pinned")
        }
    }

    private func stat(_ value: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(value).font(_TsJm9981Bq.display(22)).foregroundStyle(_YcPg5562Wv.gold)
            Text(label).font(_TsJm9981Bq.mono(10)).foregroundStyle(_YcPg5562Wv.inkSoft)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 16)
        .frosted(radius: _HkFd3347Uc.tileRadius)
    }

    private func group<C: View>(_ title: String, @ViewBuilder _ content: () -> C) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(_TsJm9981Bq.mono(11)).tracking(2).foregroundStyle(_YcPg5562Wv.inkSoft).padding(.leading, 6)
            VStack(spacing: 0) { content() }.frosted()
        }
    }

    private func row(_ glyph: String, _ title: String, _ tint: Color, _ act: @escaping () -> Void) -> some View {
        Button(action: act) {
            HStack(spacing: 12) {
                Image(systemName: glyph).foregroundStyle(tint).frame(width: 26)
                Text(title).font(_TsJm9981Bq.label(16)).foregroundStyle(_YcPg5562Wv.ink)
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold)).foregroundStyle(_YcPg5562Wv.inkSoft)
            }
            .padding(.horizontal, 16).padding(.vertical, 15)
        }
    }

    private var divider: some View {
        Rectangle().fill(_YcPg5562Wv.hairline).frame(height: 1).padding(.leading, 52)
    }

    private var about: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Vinora pulls release data from MusicBrainz and cover art from the Cover Art Archive — community-run, open music databases.")
                .font(_TsJm9981Bq.liner(13)).foregroundStyle(_YcPg5562Wv.inkSoft).lineSpacing(3)
            Link(destination: URL(string: "https://musicbrainz.org")!) {
                HStack(spacing: 4) {
                    Text("About MusicBrainz").font(_TsJm9981Bq.label(13))
                    Image(systemName: "arrow.up.right").font(.system(size: 11, weight: .bold))
                }
                .foregroundStyle(_YcPg5562Wv.gold)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16).frosted()
    }
}

private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}

private enum _WebDest: Identifiable {
    case contact, privacy
    var id: String { title }
    var title: String { self == .contact ? "Contact" : "Privacy" }
    var address: String {
        self == .contact
            ? _sd("aHR0cHM6Ly9uZXctdmlub3JhY3JhdGUucHJvL2NvbnRhY3Q=")
            : _sd("aHR0cHM6Ly9uZXctdmlub3JhY3JhdGUucHJvL3ByaXZhY3k=")
    }
}
