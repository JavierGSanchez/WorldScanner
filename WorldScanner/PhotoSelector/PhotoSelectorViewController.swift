//
//  PhotoSelectorViewController.swift
//  WorldScanner
//
//  Created by Javier on 2/27/22.
//


import UIKit
import AVFoundation

class PhotoSelectorViewController: UIViewController {
   private var mainImage: UIImage?
   private var thumbnail: UIImage?
   override func viewDidLoad() {
      super.viewDidLoad()
      initialize()
   }
    
}

// MARK: - Private Extension
private extension PhotoSelectorViewController {
   func initialize() {
      checkSource()
   }
    
    

    
}

extension PhotoSelectorViewController: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
   func showCameraUserInterface() {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
   #if targetEnvironment(simulator)
      imagePicker.sourceType =
      UIImagePickerController.SourceType.photoLibrary
   #else
      imagePicker.sourceType =
      UIImagePickerController.SourceType.camera
      imagePicker.showsCameraControls = true
   #endif
      imagePicker.mediaTypes = ["public.image"]
      imagePicker.allowsEditing = true
      self.present(imagePicker, animated: true,
      completion: nil)
   }
    
   func imagePickerControllerDidCancel(_ picker:
   UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
   }
    
   func imagePickerController(_ picker: UIImagePickerController,
   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
         self.thumbnail = selectedImage.preparingThumbnail(of: CGSize(width: 100, height: 100))
         
      }
       
      picker.dismiss(animated: true){
          print("imagePickerController: picker.dismiss()")
      }
   }
    
    func checkSource() {
       let cameraMediaType = AVMediaType.video
       let cameraAuthorizationStatus =
       AVCaptureDevice.authorizationStatus(for:
       cameraMediaType)
       switch cameraAuthorizationStatus {
       case .notDetermined:
          AVCaptureDevice.requestAccess(for:
          cameraMediaType) { granted in
             if granted {
                DispatchQueue.main.async {
                   self.showCameraUserInterface()
                }
             }
          }
       case .authorized:
          self.showCameraUserInterface()
       default:
          break
       }
    }
}

