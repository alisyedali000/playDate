//
//  UIImageExtension.swift
//  PlayDate
//
//  Created by Aadil on 24/05/2023.
//

import Foundation
import UIKit

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
    
        func resizedTo1MB() -> UIImage? {
            guard let imageData = self.pngData() else { return nil }
            let megaByte = 500.0  // previous it was 1000.0

            var resizingImage = self
            var imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB

            while imageSizeKB > megaByte { // ! Or use 1024 if you need KB but not kB
                guard let resizedImage = resizingImage.resized(withPercentage: 0.5),
                      let imageData = resizedImage.pngData() else { return nil }

                resizingImage = resizedImage
                imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
            }

            return resizingImage
        }
        func resized(withPercentage percentage: CGFloat) -> UIImage? {
            let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
            UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
            defer { UIGraphicsEndImageContext() }
            draw(in: CGRect(origin: .zero, size: canvasSize))
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    
}

