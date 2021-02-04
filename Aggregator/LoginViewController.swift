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
//        LoginTextField.delegate = self
//        PasswTextField.delegate = self
    }
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        // checklogin
//        performSegue(withIdentifier: "toMain", sender: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initVC = storyboard.instantiateInitialViewController()
        if let initVC = initVC {
            initVC.modalPresentationStyle = .overCurrentContext
            show(initVC, sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
