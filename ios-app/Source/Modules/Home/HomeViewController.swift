import IGListKit
import UIKit

public class HomeViewController: UIViewController {
  public var presenter: HomePresenterProtocol!

  private var collectionView: UICollectionView = {
    let view = UICollectionView(frame: CGRect.zero,
                                collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = UIColor.clear
    return view
  }()

  private lazy var adapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(),
                                                      viewController: self)
  private var items: [ListDiffable] = [] {
    didSet {
      adapter.performUpdates(animated: true, completion: nil)
    }
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()

    view.backgroundColor = UIColor.red
  }

  // MARK: - setup methods

  private func setupCollectionView() {
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}
