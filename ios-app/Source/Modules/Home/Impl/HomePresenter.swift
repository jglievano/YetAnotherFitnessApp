import HomeBase

struct HomePresenter: HomePresenterProtocol {
  var interactor: HomeInteractorProtocol!
  var router: HomeRouterProtocol!

  public init(
    interactor: HomeInteractorProtocol,
    router: HomeRouterProtocol
  ) {
    self.interactor = interactor
    self.router = router
  }
}
