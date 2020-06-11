import UIKit
import RxSwift
import SnapKit
import RxDataSources

class SettingViewController: UIViewController {
    
    // MARK: - Private
    
    private let viewModel: SettingViewModel
    private let disposeBag = DisposeBag()
    private let tableView: UITableView
    
    private let dataSource = RxTableViewSectionedReloadDataSource<SettingViewModel.Section>(configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
        
        switch item {
        case .creditCard(let card):
            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell", for: indexPath) as! BaseSubtitleCell
            
            cell.textLabel?.text = card.holderName
            cell.detailTextLabel?.text = card.cardNumber
            cell.accessoryType = .disclosureIndicator
            
            return cell
        case .logout:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.titleLabel.text = "登出"
            return cell
        }
    })
    
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
        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
