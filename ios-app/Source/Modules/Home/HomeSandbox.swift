import UIKit

import Home
import SandboxInterface

public class SandboxProvider: SandboxProviderProtocol {
  public static var viewController: UIViewController {
    return HomeBuilder.build()
  }
}