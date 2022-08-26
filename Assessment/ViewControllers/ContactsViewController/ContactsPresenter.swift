
import Foundation

// MARK: - Presentation Protocol
protocol ContactsPresentationProtocol {
    func presentProfile(response: ContactsViewController.Contacts.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class ContactsPresenter {
    weak var viewController: ContactsDisplayLogic?
    init(viewController: ContactsDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension ContactsPresenter: ContactsPresentationProtocol {
    
    func presentProfile(response: ContactsViewController.Contacts.ViewData) {
        viewController?.displayContacts(viewData: response)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
        
    }
}
