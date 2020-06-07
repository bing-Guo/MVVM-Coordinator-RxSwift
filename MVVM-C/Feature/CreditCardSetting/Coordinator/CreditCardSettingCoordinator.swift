import Foundation
import RxCocoa
import RxSwift
import UIKit

class CreditCardSettingCoordinator: BaseCoordinator<CreditCardSettingViewModel.FinishReason> {
    
    // MARK: - Private
    
    private let fromViewController: UIViewController
    
    // MARK: - Constructor
    
    init(viewController: UIViewController) {
        fromViewController = viewController
    }
    
    // MARK: - Override
    override func start() -> Observable<CreditCardSettingViewModel.FinishReason> {
        let viewModel = CreditCardSettingViewModel()
        let viewController = CreditCardSettingViewController(viewModel: viewModel)
        
        fromViewController.present(viewController, animated: true, completion: nil)
        
        return viewModel.didClose.take(1).do(afterNext: { _ in viewController.dismiss(animated: true, completion: nil)})
        
    }
}
