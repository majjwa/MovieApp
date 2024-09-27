//
//  DetailsScreenViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class DetailsScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func dismissBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
