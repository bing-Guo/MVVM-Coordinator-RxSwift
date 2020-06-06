import Foundation
import RxSwift

extension CreditCardSettingViewModel {
    
    enum FinishReason {
        case cancel
    }
    
}

class CreditCardSettingViewModel {
    
    // MARK: - Input
    
//    var data: [CreditCard]
    let cards = [
        CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441"),
        CreditCard(holderName: "Bing", cardNumber: "5500000000000004", expiryYear: 01, expiryMonth: 23, cvc: "123")
    ]
    let data: Observable<[CreditCard]>
    
    // MARK: - Output
    
    let didClose: Observable<FinishReason>
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        didClose = .just(.cancel)
        data = Observable.from(optional: cards)
    }
    
//    func tmpe() {
//        FakeAPIService.shared.getCreditCardData() { [weak self] (cards) in
//            self?.data = cards
//        }
//    }
}

