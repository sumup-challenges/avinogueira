import UIKit

final class OrdersListController: UITableViewController {

    private lazy var dataSource = makeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        navigationItem.rightBarButtonItem = plusButton
        tableView.dataSource = dataSource
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        update(with: sampleOrders, animate: false) // Initial update
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Int, Order> {
        UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, order in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: OrderCell.identifier,
                    for: indexPath
                ) as? OrderCell

                cell?.titleLabel.text = "Order #\(order.storeID)"
                cell?.dateLabel.text = "13:28"
                cell?.statusLabel.text = "PENDING"
                cell?.subtitleLabel.text = "\(order.items.count) items"

                return cell
            }
        )
    }

    func update(with orders: [Order], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Order>()
        snapshot.appendSections([0])

        snapshot.appendItems(orders, toSection: 0)

        dataSource.apply(snapshot, animatingDifferences: animate)
    }

}

final class OrderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var statusLabel: UILabel!

    @IBOutlet weak var statusContainer: UIView!

    static let identifier = "OrderCell"
}
