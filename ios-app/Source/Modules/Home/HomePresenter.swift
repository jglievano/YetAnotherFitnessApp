protocol HomePresenterProtocol {}

final class HomePresenter: HomePresenterProtocol {
  var interactor: HomeInteractorProtocol!
  var router: HomeRouterProtocol!

  init(
    interactor: HomeInteractorProtocol,
    router: HomeRouterProtocol
  ) {
    self.interactor = interactor
    self.router = router
  }
}