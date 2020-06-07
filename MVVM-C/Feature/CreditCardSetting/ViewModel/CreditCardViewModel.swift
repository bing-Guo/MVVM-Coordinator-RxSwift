import Foundation
import UIKit

class CreditCardViewModel: SettingCellProtocol {
    var icon: UIImage? = UIImage(systemName: "creditcard.fill")
    var title: String? = "信用卡設定"
    var subtitle: String? = ""
    
    let holderName: String
    let cardNumber: String
    let expiryYear: Int
    let expiryMonth: Int
    let cvc: String
    var maskNumber: String {
        return "•••• \(self.cardNumber.suffix(4))"
    }
    
    init(card: CreditCard) {
        self.holderName = card.holderName
        self.cardNumber = card.cardNumber
        self.expiryYear = card.expiryYear
        self.expiryMonth = card.expiryMonth
        self.cvc = card.cvc
    }
    
    func toCreditCard(with card: CreditCard) -> CreditCard {
        return CreditCard(holderName: self.holderName,
                          cardNumber: self.cardNumber,
                          expiryYear: self.expiryYear,
                          expiryMonth: self.expiryMonth,
                          cvc: self.cvc)
    }
}
