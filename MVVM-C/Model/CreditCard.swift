import Foundation

class CreditCard {
    let holderName: String
    let cardNumber: String
    let expiryYear: Int
    let expiryMonth: Int
    let cvc: String
    var maskNumber: String {
        return "•••• \(self.cardNumber.suffix(4))"
    }
    
    init(holderName: String, cardNumber: String, expiryYear: Int, expiryMonth: Int, cvc: String) {
        self.holderName = holderName
        self.cardNumber = cardNumber
        self.expiryYear = expiryYear
        self.expiryMonth = expiryMonth
        self.cvc = cvc
    }
}

extension CreditCard: Equatable {
    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        return lhs.holderName == rhs.holderName
            && lhs.cardNumber == rhs.cardNumber
            && lhs.expiryYear == rhs.expiryYear
            && lhs.expiryMonth == rhs.expiryMonth
            && lhs.cvc == rhs.cvc
    }
}
