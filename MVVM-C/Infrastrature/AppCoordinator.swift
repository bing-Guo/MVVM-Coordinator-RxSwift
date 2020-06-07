import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let settingCoordinator = SettingCoordinator(window: window)
        return coordinate(to: settingCoordinator)
    }
}
