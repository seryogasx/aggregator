//
//  VkViewController.swift
//  Aggregator
//
//  Created by Сергей Петров on 05.02.2021.
//

import UIKit
import VK_ios_sdk

class VkViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    let scope = ["email", "photos", "wall", "offline"]
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
        VKSdk.wakeUpSession(scope, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void in
            
            if state == .authorized {
                print("already auth")
            }
            else {
                VKSdk.authorize(self.scope)
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
