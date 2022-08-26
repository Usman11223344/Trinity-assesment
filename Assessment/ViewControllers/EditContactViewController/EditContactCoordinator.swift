
import Foundation
import UIKit

// MARK: - EditContact Router Protocol
protocol EditContactRouter: AnyObject {
    func start(from source: UIViewController, withContact contact: Contact)
}

// MARK: - EditContactCoordinator Class
class EditContactCoordinator {
    
}

// MARK: - Routing
extension EditContactCoordinator: EditContactRouter {
    
    func start(from source: UIViewController, withContact contact: Contact) {
        let viewController = EditContactViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = EditContactInteractor(presenter: EditContactPresenter(viewController: viewController), contact: contact)
        viewController.router = self
        viewController.delegate = source as? EditContactDelegate
        source.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
