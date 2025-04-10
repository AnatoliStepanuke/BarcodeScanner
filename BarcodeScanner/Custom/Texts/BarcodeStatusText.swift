import SwiftUI

struct BarcodeStatusText: View {
    
    // MARK: - Properties
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    // MARK: - Body
    var body: some View {
        Text(viewModel.statusText)
            .bold()
            .font(.largeTitle)
            .foregroundStyle(viewModel.statusTextColor)
            .padding()
    }
}
