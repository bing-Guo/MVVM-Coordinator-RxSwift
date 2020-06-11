import UIKit
import RxSwift
import SnapKit

class CreditCardSettingViewController: UIViewController {

    // MARK: - Private
    
    private let viewModel: CreditCardSettingViewModel
    private let disposeBag = DisposeBag()
    private let tableView: UITableView
    
    // MARK: - Constructor
    
    init(viewModel: CreditCardSettingViewModel) {
        self.viewModel = viewModel
        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.register(BaseSubtitleCell.self, forCellReuseIdentifier: "Cell")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
//        bindViewModel()
    }
    
    func initView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
//    func bindViewModel() {
//        self.viewModel.models.bind(to: tableView.rx.items) { [weak self] (tv, row, item) in
//            let cell = tv.dequeueReusableCell(withIdentifier: "Cell")
//            cell?.textLabel?.text = item.holderName
//            cell?.detailTextLabel?.text = item.maskNumber
//            if let image = item.icon {
//                cell?.imageView?.image = image
//            }
//            return cell ?? UITableViewCell()
//        }.disposed(by: disposeBag)
//
//        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(CreditCard.self))
//            .bind { [weak self] indexPath, model in
//                self?.viewModel.selectedCard.onNext(model)
//                let cell = self?.tableView.cellForRow(at: indexPath)
//                cell?.accessoryType = .checkmark
//        }.disposed(by: disposeBag)
//
//        Observable.zip(tableView.rx.itemDeselected, tableView.rx.modelDeselected(CreditCard.self))
//            .bind { [weak self] indexPath, model in
//                let cell = self?.tableView.cellForRow(at: indexPath)
//                cell?.accessoryType = .none
//        }.disposed(by: disposeBag)
//    }
}

