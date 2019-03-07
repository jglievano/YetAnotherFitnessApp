import SignInBase

struct SignInInteractor: SignInPresenterToInteractorProtocol {
  var presenter: SignInInteractorToPresenterProtocol?

  func signIn() {
    if Bool.random() {
      presenter.signInCompleted()
    } else {
      presenter.signInFailed()
    }
  }
}
