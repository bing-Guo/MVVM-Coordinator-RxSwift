import Foundation

class FakeAPIService {
    static let shared = FakeAPIService()
    
    private init() {}
    
    func getCreditCardData(complete: @escaping ([CreditCard]) -> ()) {
        DispatchQueue.global().async {
            sleep(1)
            
            let data = [
                CreditCard(holderName: "Bing", cardNumber: "4111111111111111", expiryYear: 04, expiryMonth: 11, cvc: "441"),
                CreditCard(holderName: "Bing", cardNumber: "5500000000000004", expiryYear: 01, expiryMonth: 23, cvc: "123")
            ]
            
            complete(data)
        }
    }
}
