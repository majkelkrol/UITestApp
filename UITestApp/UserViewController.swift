//
//  UserViewController.swift
//  UITestApp
//
//  Created by Majkel on 17/12/2022.
//

import UIKit

class UserViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlertButton(_ sender: UIButton) {
       showUserAlert()
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showUserAlert() {
        let alert = UIAlertController(title: "Hi Majkel!", message: "What's up? This is cool alert!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
