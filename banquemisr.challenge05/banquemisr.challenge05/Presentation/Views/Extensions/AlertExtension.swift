//
//  AlertExtension.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 28/09/2024.
//

import UIKit
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
