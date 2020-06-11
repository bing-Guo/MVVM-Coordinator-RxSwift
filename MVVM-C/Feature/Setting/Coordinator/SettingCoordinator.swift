import Foundation
import RxCocoa
import RxSwift
import UIKit

class SettingCoordinator: BaseCoordinator<Void> {
    
    // MARK: - Private
    
    private let window: UIWindow
    
    // MARK: - Constructor
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Override
    override func start() -> Observable<Void> {
        let viewModel = SettingViewModel()
        let viewController = SettingViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewModel.showCreditCardSetting
            .subscribe(onNext: { [weak self] cardVM in self?.showCreditCardSetting(by: cardVM, in: navigationController) })
            .disposed(by: disposeBag)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    private func showCreditCardSetting(by card: CreditCard, in navigationController: UINavigationController) {
        let viewModel = CreditCardSettingViewModel()
        let viewController = CreditCardSettingViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    

    //    private func showCreditCardSetting(on rootViewController: UIViewController) -> Observable<String?> {
    //        let creditCardSettingCoordinator = CreditCardSettingCoordinator(viewController: rootViewController)
    //        return coordinate(to: creditCardSettingCoordinator).map { result in
    //            switch result {
    //            case .cancel:
    //                return nil
    //            }
    //        }
    //    }
}
