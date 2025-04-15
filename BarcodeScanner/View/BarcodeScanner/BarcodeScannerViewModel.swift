import SwiftUI

@Observable final class BarcodeScannerViewModel {
    
    // MARK: - Properties
    var scannedCode = ""
    var alertItem: AlertItem?
    
    // MARK: - Helpers
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .gray : .green
    }
}
