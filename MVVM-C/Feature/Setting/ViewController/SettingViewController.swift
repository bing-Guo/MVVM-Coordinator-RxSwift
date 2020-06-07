import UIKit
import RxSwift
import SnapKit
import RxDataSources

class SettingViewController: UIViewController {
    
    // MARK: - Private
    
    private let viewModel: SettingViewModel
    private let disposeBag = DisposeBag()
    private let tableView: UITableView
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionOfSetting>(configureCell: configureCell)
    private lazy var configureCell: RxTableViewSectionedReloadDataSource<SectionOfSetting>.ConfigureCell = { [unowned self] (dataSource, tableView, indexPath, item) in
        
        switch item {
        case is CreditCardViewModel:
            return self.configStudentCell(atIndex: indexPath)
        case is ButtonCellViewModel:
            return self.configTeacherCell(atIndex: indexPath)
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
        tableView.register(BaseSubtitleCell.self, forCellReuseIdentifier: "BaseCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        
        self.viewModel.defaultCreditCard.asDriver().drive( tableView.rx.items ) { (tableView, row, model) -> UITableViewCell in
            
            switch model {
            case is CreditCardViewModel:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell", for: IndexPath.init(row: row, section: 0)) as! BaseSubtitleCell
                let model = model as! CreditCardViewModel
                
                cell.textLabel?.text = model.holderName
                cell.detailTextLabel?.text = model.maskNumber
                cell.accessoryType = .disclosureIndicator
                
                return cell
            case is ButtonCellViewModel:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: IndexPath.init(row: row, section: 0)) as! ButtonCell
                let model = model as! ButtonCellViewModel
                
                cell.titleLabel.text = model.title
                return cell
            default:
                return UITableViewCell()
            }
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(CreditCardViewModel.self)
            .bind(to: viewModel.showCreditCardSetting)
            .disposed(by: disposeBag)
    }
}
