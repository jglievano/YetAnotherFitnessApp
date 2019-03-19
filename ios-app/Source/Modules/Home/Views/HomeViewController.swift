import IGListKit
import UIKit

// HomeViewController is the first screen a user will see after signing in.
// The type of content displayed here is:
// - Profile summary.
// - Recent logs.
public class HomeViewController: UIViewController {
  public var presenter: HomePresenterProtocol!

  private var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero,
                                collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = .white
    return view
  }()

  private lazy var adapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(),
                                                      viewController: self,
                                                      workingRangeSize: 0)
  private var items: [ListDiffable] = [] {
    didSet {
      adapter.performUpdates(animated: true, completion: nil)
    }
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setup()

    items = [
      HomeSectionModel("0 - zero"),
      HomeSectionModel("1 - one")
    ]
  }

  // MARK: - setup methods

  private func setup() {
    print("HomeViewController:setup()")
    setupCollectionView()
    setupAdapter()
  }

  private func setupAdapter() {
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }

  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}

// MARK: - ListAdapterDataSource

extension HomeViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }

  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any)
    -> ListSectionController {
      switch object {
      case is HomeSectionModel:
        return HomeSectionController()
      default:
        fatalError("Unknown section in HomeViewController: \(object)")
      }
  }

  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
