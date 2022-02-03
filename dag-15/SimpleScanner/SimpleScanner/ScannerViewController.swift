//
//  ScannerViewController.swift
//  SimpleScanner
//
//  Created by Michael Gustavsson on 2022-02-03.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController{

    @IBOutlet weak var messageLabel: UILabel!
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeView: UIView?
    
    let supportedCodeTypes = [
        AVMetadataObject.ObjectType.upce,
        AVMetadataObject.ObjectType.code39,
        AVMetadataObject.ObjectType.code39Mod43,
        AVMetadataObject.ObjectType.code93,
        AVMetadataObject.ObjectType.code128,
        AVMetadataObject.ObjectType.ean8,
        AVMetadataObject.ObjectType.ean13,
        AVMetadataObject.ObjectType.aztec,
        AVMetadataObject.ObjectType.pdf417,
        AVMetadataObject.ObjectType.itf14,
        AVMetadataObject.ObjectType.dataMatrix,
        AVMetadataObject.ObjectType.interleaved2of5,
        AVMetadataObject.ObjectType.qr
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Använd huvudkameran för att fånga bilder eller videos...
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Kunde inte få tag i kameran")
            return
        }
        
        do {
            
            // 1. Skapa en instans av AVCaptureDeviceInput klassen, använda oss av ovanstående captureDevice...
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // 2. Koppla samman vår skapade input hanterare med vår Capture Session...
            captureSession.addInput(input)
            
            // 3. Initiera ett objekt av typen AVCaptureMetadataOutput och sätt den som utgång...
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // 4. Koppla ihop delegater med vår dispatch queue...
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
            // 5. Initiera och skapa förhandsgranskning av video inspelning...
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            
            view.layer.addSublayer(videoPreviewLayer!)
            
            // 6. Starta video inspelningen...
            captureSession.startRunning()
            
            // 7. Initiera en QR Code ram för att markera att vi hittat en kod...
            qrCodeView = UIView()
            
            if let qrCodeFrameView = qrCodeView {
                qrCodeFrameView.layer.borderColor = UIColor.orange.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                
                view.addSubview(qrCodeFrameView)
                view.bringSubviewToFront(qrCodeFrameView)
            }
            
        } catch {
            print("Oooops något gick fel! \(error)")
        }
        
        view.bringSubviewToFront(messageLabel)
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // 8. Kontrollera så att metadata objektet inte är nil och att få åtminstone har 1 objekt
        if metadataObjects.count == 0 {
            qrCodeView?.frame = CGRect.zero
            messageLabel.text = "Hittade ingen kod"
            return
        }
        
        // 9. Hämta metadata objektet...
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // Koden vi får in via videon finns i vår lista av koder...
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
            }
        }
    }
}
