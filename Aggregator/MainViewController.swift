//
//  VkViewController.swift
//  Aggregator
//
//  Created by Сергей Петров on 05.02.2021.
//

import UIKit
import VK_ios_sdk

class MainViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    var sdkInstance: VKSdk?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let sdkInstance = VKSdk.initialize(withAppId: ProcessInfo.processInfo.environment["VK_APP_ID"]) else {
            print("Init SDK error!")
            return
        }
        sdkInstance.register(self)
        sdkInstance.uiDelegate = self
    }
    
    public func checkSDK() {
        VKSdk.wakeUpSession(vkPermissions, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void in
            
            if state == .authorized {
                print("already auth")
            }
            else {
                VKSdk.authorize(vkPermissions)
            }
            return
        })
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        self.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("VK Captcha")
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(result.token ?? "Got some token")
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("Failed to auth")
    }
}
