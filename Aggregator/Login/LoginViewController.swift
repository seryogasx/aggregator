import UIKit
import VK_ios_sdk
import CryptoKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!

    var VkSdk: VKSdk?
    var toMainSegueIdentifier = "toMainSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VkSdk = VKSdk.initialize(withAppId: ProcessInfo.processInfo.environment["VK_APP_ID"])
        print("LoginViewController start")
    }
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        // checklogin
        VkSdk?.register(self)
        VkSdk?.uiDelegate = self
        VKSdk.authorize(vkPermissions, with: .disableSafariController)
        print("Auth passed!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toMainSegueIdentifier {
            let mainVC = MainViewController()
            present(mainVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Did appear")
    }
}

extension LoginViewController: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard let token = result.token else {
            print("no token")
            return
        }
        
        do {
            try KeychainStorage.set(value: token.accessToken.data(using: .utf8)!, forKey: "vkToken")
        } catch let error as KeychainStorage.KeychainError {
            print(error)
        } catch {
            print("Unknown error by set value into keychain!")
        }
        
//        do {
//            print("Got vkToken: ", String(data: try KeychainStorage.get("vkToken")!, encoding: .utf8)!)
//        } catch let error as KeychainStorage.KeychainError {
//            print(error)
//        } catch {
//            print("Unknown error by get value from keychain!")
//        }
        
//        self.performSegue(withIdentifier: self.toMainSegueIdentifier, sender: nil)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("ERROR!", #function)
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
