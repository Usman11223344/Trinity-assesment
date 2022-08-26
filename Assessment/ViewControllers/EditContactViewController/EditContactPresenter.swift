
import Foundation

// MARK: - Presentation Protocol
protocol EditContactPresentationProtocol {
    func presentContactDetail(response: EditContactViewController.EditContact.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class EditContactPresenter {
    weak var viewController: EditContactDisplayLogic?
    init(viewController: EditContactDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension EditContactPresenter: EditContactPresentationProtocol {
    
    func presentContactDetail(response: EditContactViewController.EditContact.ViewData) {
        viewController?.displayContactDetail(viewData: response)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
        
    }
}
