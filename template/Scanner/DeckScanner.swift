import SwiftUI
import Vision
import VisionKit

@MainActor
enum _BnLr0089Zy {
    static var ready: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
}

struct _XfAm8812Dw: UIViewControllerRepresentable {
    let onCapture: (String) -> Void

    func makeCoordinator() -> Pk {
        Pk(onCapture: onCapture)
    }

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let symbologies: [VNBarcodeSymbology] = [.ean13, .ean8, .upce, .code128, .qr]
        let controller = DataScannerViewController(
            recognizedDataTypes: [.barcode(symbologies: symbologies)],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: true,
            isHighlightingEnabled: true
        )
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ controller: DataScannerViewController, context: Context) {
        guard !context.coordinator._xRg4100 else { return }
        context.coordinator._xRg4100 = true
        DispatchQueue.main.async { try? controller.startScanning() }
    }

    static func dismantleUIViewController(_ controller: DataScannerViewController, coordinator: Pk) {
        controller.stopScanning()
        coordinator._xRg4100 = false
    }

    final class Pk: NSObject, DataScannerViewControllerDelegate {
        var _xRg4100 = false
        private let _xOc4101: (String) -> Void

        init(onCapture: @escaping (String) -> Void) {
            self._xOc4101 = onCapture
        }

        func dataScanner(_ scanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            _xRl4102(item)
        }

        func dataScanner(_ scanner: DataScannerViewController, didAdd added: [RecognizedItem], allItems: [RecognizedItem]) {
            added.forEach(_xRl4102)
        }

        private func _xRl4102(_ item: RecognizedItem) {
            guard case .barcode(let code) = item, let value = code.payloadStringValue else { return }
            _xOc4101(value)
        }
    }
}
