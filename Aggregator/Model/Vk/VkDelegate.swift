//
//  VkDelegate.swift
//  Aggregator
//
//  Created by Сергей Петров on 26.02.2021.
//

import Foundation
import UIKit
import VK_ios_sdk

class VkDelegate: NSObject {
    
}

extension VkDelegate: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
    
    
}
