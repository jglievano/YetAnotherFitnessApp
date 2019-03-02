import IGListKit
import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: setup methods

    private func setup() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }
}

extension HomeCollectionViewCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        switch viewModel {
        case let viewModel as HomeSectionModel:
            titleLabel.text = viewModel.title
        default:
            assertionFailure("Unsupported view model type: \(viewModel)")
        }
    }
}