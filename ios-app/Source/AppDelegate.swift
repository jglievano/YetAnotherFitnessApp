import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import UIKit

import Home

@UIApplicationMain
class AppDelegate: UIResponder {
  var window: UIWindow?

  func afterLaunchSetup() {
    MSAppCenter.start("3814c32e-f876-4361-b18f-f4e43e2c83c0", withServices: [
        MSAnalytics.self,
        MSCrashes.self
    ])
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = HomeBuilder.build()
    window?.makeKeyAndVisible()
  }
}

extension AppDelegate: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    afterLaunchSetup()
    return true
  }
  func applicationWillResignActive(_ application: UIApplication) {}
  func applicationDidEnterBackground(_ application: UIApplication) {}
  func applicationWillEnterForeground(_ application: UIApplication) {}
  func applicationDidBecomeActive(_ application: UIApplication) {}
  func applicationWillTerminate(_ application: UIApplication) {}
}
