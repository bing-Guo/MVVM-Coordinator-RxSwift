import Foundation
import RxSwift

extension CreditCardSettingViewModel {
    
    enum FinishReason {
        case cancel
    }
    
}

class CreditCardSettingViewModel {
    
    // MARK: - Input
    
    var selected: BehaviorSubject<CreditCardViewModel?>
    
    let cards = [
        CreditCardViewModel(card: CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441")),
        CreditCardViewModel(card: CreditCard(holderName: "Bing", cardNumber: "5500000000000004", expiryYear: 01, expiryMonth: 23, cvc: "123"))
    ]
    let models: Observable<[CreditCardViewModel]>
    
    // MARK: - Output
    
    let didClose: Observable<FinishReason>
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        didClose = .just(.cancel)
        selected = BehaviorSubject<CreditCardViewModel?>(value: nil)
        models = Observable.from(optional: cards)
        
        _ = selected.subscribe { card in
            print(card.element??.cardNumber)
        }
    }
}

