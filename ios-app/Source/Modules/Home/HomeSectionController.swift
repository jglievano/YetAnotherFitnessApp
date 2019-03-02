import IGListKit

final class HomeSectionController: ListBindingSectionController<HomeSectionModel> {
  override init() {
    super.init()
    
    dataSource = self
  }
}

// MARK: - ListBindingSectionControllerDataSource

extension HomeSectionController: ListBindingSectionControllerDataSource {
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                         viewModelsFor object: Any) -> [ListDiffable] {
    guard let model = object as? HomeSectionModel else { return [] }
    return [model]
  }

  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                         cellForViewModel viewModel: Any,
                         at index: Int) -> UICollectionViewCell & ListBindable {
    print("HomeSectionController:sectionController(_:viewModel:index)")
    guard let context = collectionContext else { fatalError("Unexpected nil collectionContext") }
    switch viewModel {
    case is HomeSectionModel:
      guard let cell = context.dequeueReusableCell(of: HomeCollectionViewCell.self,
                                                   for: sectionController,
                                                   at: index) as? HomeCollectionViewCell
      else {
        fatalError("Could not dequeue cell for \(viewModel)")
      }
      return cell
    default:
      fatalError("Unexpected model type in HomeSectionController: \(viewModel)")
    }
  }

  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                         sizeForViewModel viewModel: Any,
                         at index: Int) -> CGSize {
    guard let context = collectionContext else { return .zero }
    switch viewModel {
    case is HomeSectionModel:
      return CGSize(width: context.containerSize.width - 32, height: 70)
    default:
      fatalError("Unexpected model type in HomeSectionController: \(viewModel)")
    }
  }
}
