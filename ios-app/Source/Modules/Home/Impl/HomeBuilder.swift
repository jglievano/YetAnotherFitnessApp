import HomeBase

public class HomeBuilder {
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
