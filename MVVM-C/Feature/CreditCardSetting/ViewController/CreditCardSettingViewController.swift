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
        bindViewModel()
    }
    
    func initView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        self.viewModel.models.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: BaseSubtitleCell.self)) { (row, model, cell) in
            cell.textLabel?.text = model.holderName
            cell.detailTextLabel?.text = model.maskNumber
            if let image = model.icon {
                cell.imageView?.image = image
            }
        }.disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(CreditCardViewModel.self))
            .bind { [weak self] indexPath, model in
                let cell = self?.tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                self?.viewModel.selected.onNext(model)
        }
        .disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.itemDeselected, tableView.rx.modelDeselected(CreditCardViewModel.self))
            .bind { [weak self] indexPath, model in
                let cell = self?.tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .none
        }
        .disposed(by: disposeBag)
    }
}

