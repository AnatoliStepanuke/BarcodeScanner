import UIKit
import AVFoundation

protocol ScannerViewControllerDelegate: AnyObject {
    func didFind(barcode: String)
}

final class ScannerViewController: UIViewController {
    
    // MARK: - Constants
    let captureSession = AVCaptureSession()
    
    // MARK: - Variables
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerViewControllerDelegate?
    
    // MARK: - Init
    init(scannerDelegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Setups
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("Failed to create video input: \(error)")
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    
}
