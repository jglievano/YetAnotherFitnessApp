import IGListKit

final class HomeSectionModel {
  let title: String

  init(_ title: String = "Hello, World!") {
    self.title = title
  }
}

extension HomeSectionModel: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return title as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return true
  }
}