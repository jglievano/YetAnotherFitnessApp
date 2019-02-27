import IGListKit

final class HomeSectionController:
    ListBindableSectionController<HomeSectionModel>,
    ListBindingSectionControllerDataSource {
  init() {
    super.init()
    dataSource = self
  }

  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                         viewModelsFor object: Any) -> [ListDiffable] {
    guard let model = object as? HomeSectionModel else { return [] }
    return [model]
  }

  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                         cellForViewModel viewModel: Any,
                         at index: Int) -> UICollectionViewCell & ListBindable {
    switch viewModel {
    case is HomeSectionModel:
      return dequeueClassCell(HomeCollectionViewCell.self, for: index)
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
