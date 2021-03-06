import Foundation
import RxDataSources

typealias SettingOfSection = SectionModel<TableViewSection, TableViewItem>

enum TableViewSection {
    case main
    case log
}

enum TableViewItem {
    case creditCard(info: CreditCard)
    case login(info: String)
}
