import Foundation
import UIKit

class ButtonCellViewModel: SettingCellProtocol {
    var icon: UIImage?
    var title: String?
    var subtitle: String?
    
    init(title: String) {
        self.title = title
    }
}
