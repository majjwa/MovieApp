//
//  loadImageExtension.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = nil // Set to nil if the URL is invalid
            return
        }
        
        // Set a placeholder image if desired
        self.image = UIImage(named: "placeholder") // Replace "placeholder" with your placeholder image name
        
        // Fetch the image data in the background
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors and valid data
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("No data or invalid image data")
                return
            }
            
            // Update the image view on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume() // Start the task
    }
}
