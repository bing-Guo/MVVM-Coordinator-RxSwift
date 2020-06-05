import Foundation
import RxSwift

extension CreditCardSettingViewModel {
    
    enum FinishReason {
        case cancel
    }
    
}

class CreditCardSettingViewModel {
    
    // MARK: - Input
    
    // MARK: - Output
    
    let didClose: Observable<FinishReason>
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        didClose = .just(.cancel)
    }
}

