import SwiftUI
import WebKit

struct _ByJm4412Ws: View {
    let title: String
    let address: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            _WovenWeb(address: address)
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Done") { dismiss() }
                    }
                }
        }
        .tint(_YcPg5562Wv.gold)
    }
}

private struct _WovenWeb: UIViewRepresentable {
    let address: String

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        if let url = URL(string: address) {
            view.load(URLRequest(url: url))
        }
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
