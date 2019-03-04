import HomeBase

import HomePresenter
import HomeInteractor
import HomeRouter

// HomeBuilder builds a HomeViewController with final implementations.
// Usage:
//   HomeBuilder.build()
public class HomeBuilder {

  // Returns a new instance of HomeViewController.
  public static func build() -> HomeViewController {
    print("HomeBuilder:build()")
    let viewController = HomeViewController()
    let presenter = HomePresenter(
      interactor: HomeInteractor(),
      router: HomeRouter()
    )
    viewController.presenter = presenter
    return viewController
  }

}
