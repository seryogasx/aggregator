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
        VkSdk = VKSdk.initialize(withAppId: (UserDefaults.standard.value(forKey: "some_init_value") as! String))
        print("LoginViewController start")
    }
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        // checklogin
        VkSdk?.register(self)
        VkSdk?.uiDelegate = self
        VKSdk.authorize(vkPermissions, with: .disableSafariController)
        print("Auth passed!")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == toMainSegueIdentifier {
//            let mainVC = MainViewController()
//            present(mainVC, animated: true, completion: nil)
//        }
//    }
    
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
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true, completion: nil)
//            mainVC.presentingViewController?.dismiss(animated: false, completion: nil)
        } catch let error as KeychainStorage.KeychainError {
            print(error)
        } catch {
            print("Unknown error by set value into keychain!")
            let alert = UIAlertController(title: "Unknown error by set value into keychain!", message: "wtf?", preferredStyle: .actionSheet)
            let alertAction = UIAlertAction(title: "EMMM..ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
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
        print(#function)
    }
//
//    func vkSdkDidDismiss(_ controller: UIViewController!) {
//        print(#function)
//    }
//
//    func vkSdkWillDismiss(_ controller: UIViewController!) {
//        print(#function)
//    }
//
//    func vkSdkAuthorizationStateUpdated(with result: VKAuthorizationResult!) {
//        print(#function)
//    }
//
//    func vkSdkTokenHasExpired(_ expiredToken: VKAccessToken!) {
//        print(#function)
//    }
//
//    func vkSdkAccessTokenUpdated(_ newToken: VKAccessToken!, oldToken: VKAccessToken!) {
//        print(#function)
//    }
//
//    override func vks_presentThroughDelegate() {
//        print(#function)
//    }
//
//    override func vks_viewControllerDidDismiss() {
//        print(#function)
//    }
//
//    override func vks_viewControllerWillDismiss() {
//        print(#function)
//    }
    
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
