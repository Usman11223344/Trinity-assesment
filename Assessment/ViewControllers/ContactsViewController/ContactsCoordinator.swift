
import Foundation
import UIKit

// MARK: - Contacts Router Protocol
protocol ContactsRouter: AnyObject {
    func start()
    func showEditContactViewController(from source: UIViewController, withContact contact: Contact)
}

// MARK: - ContactsCoordinator Class
class ContactsCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Routing
extension ContactsCoordinator: ContactsRouter {
    
    func start() {
        let viewController = ContactsViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = ContactsInteractor(presenter: ContactsPresenter(viewController: viewController))
        viewController.router = self
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func showEditContactViewController(from source: UIViewController, withContact contact: Contact) {
        let coordinator = EditContactCoordinator.init()
        coordinator.start(from: source, withContact: contact)
    }
    
}
