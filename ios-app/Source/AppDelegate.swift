import UIKit

import Home

@UIApplicationMain
class AppDelegate: UIResponder {
  var window: UIWindow?

  func afterLaunchSetup() {
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
