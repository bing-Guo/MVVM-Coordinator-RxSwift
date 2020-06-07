import Foundation
import RxSwift
import RxCocoa
import RxDataSources

typealias SectionOfSetting = SectionModel<SettingSection, SettingCellProtocol>

enum SettingSection {
    case creditCard
    case login
}

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
    
    let defaultCreditCard: BehaviorRelay<[SectionOfSetting]>
    
    // MARK: - Output
    
    let showCreditCardSetting: PublishRelay<CreditCardViewModel>
    
    // MARK: - Private
    
    // MARK: - Constructor
    
    init() {
        let cardVM = CreditCardViewModel(card: CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441"))
        let logoutVM = ButtonCellViewModel(title: "登出")
        let sections = [
            SectionOfSetting(model: .creditCard, items: [cardVM]),
            SectionOfSetting(model: .login, items: [logoutVM])
        ]
        self.defaultCreditCard = BehaviorRelay<[SectionOfSetting]>(value: sections)
        self.showCreditCardSetting = PublishRelay<CreditCardViewModel>()
    }
    
    
}

