import UIKit
import RxSwift
import SnapKit
import RxDataSources

class SettingViewController: UIViewController {
    
    // MARK: - Private
    
    private let viewModel: SettingViewModel
    private let disposeBag = DisposeBag()
    private let tableView: UITableView
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SettingOfSection>(configureCell: configureCell)
    private lazy var configureCell: RxTableViewSectionedReloadDataSource<SettingOfSection>.ConfigureCell = { [unowned self] (dataSource, tableView, indexPath, item) in
        
        switch item {
        case .creditCard(let CreditCardViewModel):
            return self.configStudentCell(vm: CreditCardViewModel, atIndex: indexPath)
        case .login(let str):
            return self.configTeacherCell(vm: str, atIndex: indexPath)
        }
    }
    
    // MARK: - Constructor
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        self.tableView = UITableView(frame: .zero, style: .grouped)
        
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
        tableView.bounces = false
        tableView.register(BaseSubtitleCell.self, forCellReuseIdentifier: "BaseCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension SettingViewController {
    
    func configStudentCell(vm: CreditCardViewModel, atIndex: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell", for: atIndex) as! BaseSubtitleCell
        
        cell.textLabel?.text = vm.holderName
        cell.detailTextLabel?.text = vm.maskNumber
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func configTeacherCell(vm: String, atIndex: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: atIndex) as! ButtonCell
        
        cell.titleLabel.text = vm
        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
