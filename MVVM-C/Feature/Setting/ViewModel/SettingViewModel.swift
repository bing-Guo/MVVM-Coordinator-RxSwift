import Foundation
import RxSwift
import RxCocoa
import RxDataSources

extension SettingViewModel {
    enum FinishReason {
        case cancel
    }
}

class SettingViewModel {
    
    // MARK: - Input
    
//    let creditCardSubject: PublishSubject<CreditCard>
    
    // MARK: - Output
    
    var sections: Observable<[Section]>
    let showCreditCardSetting = PublishRelay<CreditCard>()
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        sections = .empty()
        
        let allCreditCardResult = Observable<[CreditCard]>
            .just([
                CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441"),
                CreditCard(holderName: "MacusWu", cardNumber: "5111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441")
            ])
        
        let allCreditCards = Observable
            .merge(allCreditCardResult)
            .map { $0.map { SectionType.creditCard($0) } }
            
        let creditCardSection = allCreditCards
            .map { Section.init(items: $0) }
        
        let logoutSection = Observable.just( Section.init(items: [SectionType.logout]) )
        
        sections = Observable
            .combineLatest(creditCardSection, logoutSection)
            .map { [$0] + [$1] }
        
        sections.subscribe(onNext: {
            print($0)
        })
    }
}

extension SettingViewModel {
    
    enum SectionType {
        case creditCard(CreditCard)
        case logout
    }
    
    struct Section {
        var items: [Item]
    }
    
}

extension SettingViewModel.Section: SectionModelType {
    
    typealias Item = SettingViewModel.SectionType
    
    init(original: SettingViewModel.Section, items: [Item]) {
        self = original
        self.items = items
    }
    
}
