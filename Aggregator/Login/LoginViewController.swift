import UIKit
import VK_ios_sdk
import CryptoKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    let scope = ["friends", "email"]
    var VkSdk: VKSdk?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController start")
    }
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        // checklogin
        
        VkSdk = VKSdk.initialize(withAppId: "7751834")
        VkSdk?.register(self)
        VkSdk?.uiDelegate = self
        VKSdk.authorize(scope, with: .disableSafariController)
        print("Auth passed!")
    }
}

extension LoginViewController: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard let token = result.token else {
            print("no token")
            return
        }
        print(token)
        if KeychainStorage.shared.setVKAccessToken(token) {
            print("Access save token")
        } else {
            print("Fail save token")
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
}

extension LoginViewController: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        self.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
    
}
