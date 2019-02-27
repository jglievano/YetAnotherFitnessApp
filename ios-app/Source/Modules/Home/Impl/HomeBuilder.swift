import HomeBase

public class HomeBuilder {
  public static func build() -> HomeViewController {
    let viewController = HomeViewController()
    let presenter = HomePresenter(
      interactor: HomeInteractor(),
      router: HomeRouter()
    )
    viewController.presenter = presenter
    return viewController
  }
}
