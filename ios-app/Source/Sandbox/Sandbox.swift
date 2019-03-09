import UIKit

import SandboxInterface

public class SandboxProvider: SandboxProviderProtocol {
  public static var viewController: UIViewController {
    return UIViewController()
  }
}
