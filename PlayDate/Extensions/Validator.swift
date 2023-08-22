//
//  File.swift
//  
//
//  Created by Qazi Mudassar on 12/02/2023.
//

import Foundation
import UIKit

public final class Validator {

    public static let shared = Validator()

    public func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

    func isImageEmpty(img: UIImage) -> Bool {
        // check to find either image is empty of not
        let cgref = img.cgImage
        let cim = img.ciImage

        if cim == nil && cgref == nil {
            return false
        }

        return true
    }

}
