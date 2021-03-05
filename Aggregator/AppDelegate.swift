import UIKit
import VK_ios_sdk
import CoreData

let vkPermissions = ["friends", "email"]
let instPermissions = ["feed", "email"]


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VkModel")
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("Fail to loadPersistentStores") }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var context: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.mainContext
        return context
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.setValue("7751834", forKey: "some_init_value")
        window = UIWindow(frame: UIScreen.main.bounds)
        VKSdk.initialize(withAppId: (UserDefaults.standard.value(forKey: "some_init_value") as! String))
        VKSdk.wakeUpSession(vkPermissions) { [weak self] (state, error) in
            if state == VKAuthorizationState.authorized {
                self?.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            } else {
                self?.window?.rootViewController = LoginViewController()
            }
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String)
        print("url: \(url)")
        return true
    }

    private func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        VKSdk.processOpen(url as URL?, fromApplication: sourceApplication)
        print("url: \(url)")
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        VKSdk.forceLogout()
    }
}
