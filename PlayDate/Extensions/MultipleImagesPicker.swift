//
//  PhotoPicker.swift
//  Unified
//
//  Created by Qazi Ammar Arshad on 14/07/2022.
//

import Foundation
import SwiftUI
import PhotosUI

public struct MultipleImagesPicker: UIViewControllerRepresentable {
    
    public typealias UIViewControllerType = PHPickerViewController
    
    var selectionLimit: Int
    var itemProviders: [NSItemProvider] = []
    var onImagePicked: ([UIImage]) -> Void
    
    public func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = self.selectionLimit
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        return MultipleImagesPicker.Coordinator(parent: self, onImagePicked: self.onImagePicked)
    }
    
    public class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {
        
        var parent: MultipleImagesPicker
        var onImagePicked: ([UIImage]) -> Void
        
        init(parent: MultipleImagesPicker, onImagePicked: @escaping ([UIImage]) -> Void) {
            
            self.parent = parent
            self.onImagePicked = onImagePicked
        }
        
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Dismiss picker
            picker.dismiss(animated: true)
            
            if !results.isEmpty {
                parent.itemProviders = []
            }
            
            parent.itemProviders = results.map(\.itemProvider)
            
            self.loadImage()
        }
        
        private func loadImage() {
            
            let dispatchGroup = DispatchGroup()
            var processedResults = [UIImage]()
            
            for itemProvider in parent.itemProviders {
                dispatchGroup.enter()
                
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        
                        if let image = image as? UIImage {
                            processedResults.append(image)
                            
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                        }
                        
                        dispatchGroup.leave()
                    }
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                
                self.onImagePicked(processedResults)
            }
        }
    }
}
