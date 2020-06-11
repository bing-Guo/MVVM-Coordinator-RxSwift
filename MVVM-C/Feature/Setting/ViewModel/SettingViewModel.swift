import Foundation
import RxSwift
import RxCocoa

protocol SettingCellProtocol {
    var icon: UIImage? { get }
    var title: String? { get set }
    var subtitle: String? { get set }
}

extension SettingViewModel {
    
    enum FinishReason {
        case cancel
    }
    
}

class SettingViewModel {
    
    // MARK: - Input
    
    let items = PublishSubject<[SettingOfSection]>()
    
    // MARK: - Output
    
    let showCreditCardSetting = PublishRelay<CreditCardViewModel>()
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        let cardVM = CreditCardViewModel(card: CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441"))
        
        var subItems = [TableViewItem]()
        
        subItems = ([
            .creditCard(info: cardVM)
        ])
        
        items.onNext([
            SettingOfSection(model: .main, items: subItems)
        ])
    }
}


