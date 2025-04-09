import SwiftUI

struct BarcodeStatusText: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        Text(viewModel.statusText)
            .bold()
            .font(.largeTitle)
            .foregroundStyle(viewModel.statusTextColor)
            .padding()
    }
}
