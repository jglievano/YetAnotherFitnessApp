import RxSwift
import UIKit

final class SignInViewController: UICollectionViewController {
  private let bag = DisposeBag()
  private var presenter: SignInPresenter!

  private var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero,
                                collectionViewLayout: UICollectionViewLayout())
    view.backgroundColor = .clear
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.eventSubject
      .subscribe(onNext: { event in
      })
      .disposed(by: bag)
  }
}
