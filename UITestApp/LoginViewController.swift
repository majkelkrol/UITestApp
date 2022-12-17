//
//  ViewController.swift
//  UITestApp
//
//  Created by Majkel on 17/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTextFieldLabel: UITextField!
    @IBOutlet weak var passwordTextFieldLabel: UITextField!
    @IBOutlet weak var loginButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTextField(_ sender: UITextField) {
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
    }
    
    @IBAction func loginButtonPresssed(_ sender: UIButton) {
        guard loginTextFieldLabel.text != "" && passwordTextFieldLabel.text != "" else {
            showLoginAlert()
            return
        }
        let vc = storyboard?.instantiateViewController(identifier: "UserViewController") as! UserViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func showLoginAlert() {
        let alert = UIAlertController(title: "Houston! We have a problem", message: "User propably typed a wrong data. Let's try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

