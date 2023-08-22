//
//  File.swift
//  
//
//  Created by Qazi Mudassar on 16/02/2023.
//

import Foundation
import SwiftUI

public struct ImagePicker: UIViewControllerRepresentable {
    
    private let sourceType: UIImagePickerController.SourceType
    private let didFinishPickingImage: (UIImage) -> Void
    private let allowsEditing: Bool
    @Environment(\.dismiss) var dismiss
    
   public init(allowsEditing: Bool, sourceType: UIImagePickerController.SourceType, didFinishPickingImage: @escaping (UIImage) -> Void) {
        self.sourceType = sourceType
        self.didFinishPickingImage = didFinishPickingImage
        self.allowsEditing = allowsEditing
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        picker.allowsEditing = allowsEditing
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(onDismiss: { dismiss() },
                    didFinishPickingImage: didFinishPickingImage)
    }
    
    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        private let onDismiss: () -> Void
        private let didFinishPickingImage: (UIImage) -> Void
        
        init(onDismiss: @escaping () -> Void, didFinishPickingImage: @escaping (UIImage) -> Void) {
            self.onDismiss = onDismiss
            self.didFinishPickingImage = didFinishPickingImage
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let img = info[.editedImage] as? UIImage {
                self.didFinishPickingImage(img)
            } else if let image = info[.originalImage] as? UIImage {
                self.didFinishPickingImage(image)
            }
            self.onDismiss()
        }
        
        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            self.onDismiss()
        }
    }
}
