import SwiftUI

struct BarcodeScannerView: View {
    
    // MARK: - Properties
    @State private var viewModel = BarcodeScannerViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
               BarcodeStatusText()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
