import Foundation

class CreditCard {
    let holderName: String
    let cardNumber: String
    let expiryYear: Int
    let expiryMonth: Int
    let cvc: String
    
    init(holderName: String, cardNumber: String, expiryYear: Int, expiryMonth: Int, cvc: String) {
        self.holderName = holderName
        self.cardNumber = cardNumber
        self.expiryYear = expiryYear
        self.expiryMonth = expiryMonth
        self.cvc = cvc
    }
}
