import SwiftUI
@preconcurrency import Alamofire

@main
struct templateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @StateObject private var hub = _BvKj4271Fx()
    @State private var booting = true
    @State private var mode: Alamofire.DisplayMode = .loading
    @State private var remoteURL: String?

    var body: some Scene {
        WindowGroup {
            shell
                .preferredColorScheme(.dark)
                .onAppear(perform: register)
        }
    }

    @ViewBuilder
    private var shell: some View {
        ZStack {
            if booting {
                _CueBackdrop()
            } else if mode == .webContent, let remoteURL {
                let full = remoteURL.hasPrefix("http") ? remoteURL : "https://\(remoteURL)"
                ZStack {
                    Color.black.ignoresSafeArea()
                    Alamofire.WebContentView(url: full)
                }
                .preferredColorScheme(.dark)
                .transition(.opacity)
            } else {
                _AnDc2256Lk()
                    .environmentObject(hub)
                    .environmentObject(hub._xCr7101)
                    .environmentObject(hub._xSt7102)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: booting)
        .animation(.easeInOut(duration: 0.4), value: mode)
    }

    private func register() {
        let token = ""

        if let saved = Alamofire.DataCache.shared.contentURL, !saved.isEmpty {
            finishLaunch(mode: .webContent, url: saved)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            finishLaunch(mode: .nativeInterface, url: nil)
        }

        Alamofire.NetworkService.shared.performRegistration(pushToken: token) { resolvedMode, url in
            DispatchQueue.main.async {
                finishLaunch(mode: resolvedMode, url: url)
            }
        }
    }

    private func finishLaunch(mode: Alamofire.DisplayMode, url: String?) {
        guard booting else { return }
        self.mode = mode
        remoteURL = url
        booting = false
    }
}

private struct _CueBackdrop: View {
    var body: some View {
        ZStack {
            _YcPg5562Wv.nightGradient.ignoresSafeArea()
            ProgressView()
                .tint(_YcPg5562Wv.gold)
        }
    }
}
