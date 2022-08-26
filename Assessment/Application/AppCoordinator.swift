
import Foundation
import UIKit

// MARK: - AppRouter Protocol
protocol AppRouter: AnyObject {
    func start()
}

final class AppCoordinator {
    
    private var window: UIWindow
    private var contactsCoordinator: ContactsCoordinator?

    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Private Methods
    private func showContactsController() {
        self.contactsCoordinator = ContactsCoordinator.init(window: window)
        self.contactsCoordinator?.start()
    }
}

// MARK: - AppRouter Delegates
extension AppCoordinator: AppRouter {
    
    func start() {
        self.window.backgroundColor = .white
        if #available(iOS 13.0, *) {
            self.window.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.window.makeKeyAndVisible()
        showContactsController()
    }
}
