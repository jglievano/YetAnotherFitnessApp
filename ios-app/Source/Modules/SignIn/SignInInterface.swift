// View's
protocol SignInPresenterToViewProtocol {
  func showSuccess()
  func showError()
}

// Interactor's
protocol SignInPresenterToInteractorProtocol {
  func signIn()
}

// Presenter's
protocol SignInInteractorToPresenterProtocol {
  func signInCompleted()
  func signInFailed()
}

protocol SignInViewToPresenterProtocol {
  func viewDidLoad()
}

