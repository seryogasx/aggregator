//
//  LoginViewController.swift
//  Aggregator
//
//  Created by Сергей Петров on 04.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        // checklogin
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initVC = storyboard.instantiateInitialViewController()
        if let initVC = initVC {
            initVC.modalPresentationStyle = .overCurrentContext
            show(initVC, sender: nil)
        }
        
    }
}
