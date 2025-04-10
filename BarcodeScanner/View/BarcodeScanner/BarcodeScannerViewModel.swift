import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    // MARK: - Helpers
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .gray : .green
    }
}
