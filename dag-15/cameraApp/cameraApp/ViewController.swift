//
//  ViewController.swift
//  cameraApp
//
//  Created by Michael Gustavsson on 2022-02-03.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openCamera(_ sender: UIButton) {
        print("Starta kameran")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }else {
            print("Kameran är ur bruk")
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePicture(_ sender: UIButton) {
        guard let imageData = imageViewer.image?.jpegData(compressionQuality: 0.75) else {
            print("Gick inte att skapa imageData")
            return
        }
        
        print("Image Data \(imageData)")
        
        guard let image = UIImage(data: imageData) else {
            print("Gick inte att skapa en bild av bild informationen")
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    
    @IBAction func uploadPicture(_ sender: UIButton) {
        
//        guard let imageData = imageViewer.image?.jpegData(compressionQuality: .75) else{
//            return
//        }
//
//        guard let image = UIImage(data: imageData) else {
//            return
//        }
//
//        let data = imageData.base64EncodedData()
        
        // 1. POST till ett rest api multiform
        // 2. Blob storage (AWS, Azure, GCP ....)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Färdig")
        
        let image = info[.originalImage] as! UIImage
        
        imageViewer.image = image
        
        print("Bild storlek \(image.size))")
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Avbröt")
        dismiss(animated: true, completion: nil)
    }
}

