import Foundation
import RxSwift

extension CreditCardSettingViewModel {
    
    enum FinishReason {
        case cancel
        case selected(_ card: CreditCardViewModel)
    }
    
}

class CreditCardSettingViewModel {
    
    // MARK: - Input
    let cancel: AnyObserver<Void>
    let done: AnyObserver<Void>
    var selectedCard: BehaviorSubject<CreditCardViewModel?>
    
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
        let cancelSubject = PublishSubject<Void>()
        cancel = cancelSubject.asObserver()
        
        let doneSubject = PublishSubject<Void>()
        done = doneSubject.asObserver()
        
        selectedCard = BehaviorSubject<CreditCardViewModel?>(value: nil)
        
        didClose = Observable.merge(cancelSubject.map{ .cancel },
                                    doneSubject.withLatestFrom(selectedCard).map { .selected($0!) } )
        models = Observable.from(optional: cards)
    }
}

