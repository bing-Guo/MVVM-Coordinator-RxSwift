import UIKit
import RxSwift
import SnapKit

class CreditCardSettingViewController: UIViewController {

    // MARK: - Private
    
    private let viewModel: CreditCardSettingViewModel
    private let disposeBag = DisposeBag()
    private let tableView: UITableView
    
    init(viewModel: CreditCardSettingViewModel) {
        self.viewModel = viewModel
        self.tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bindViewModel()
    }
    
    func bindViewModel() {
        self.viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, card, cell) in
            cell.textLabel?.text = card.cardNumber
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.bind { (indexPath) in
            print(indexPath)
        }.disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension CreditCardSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
