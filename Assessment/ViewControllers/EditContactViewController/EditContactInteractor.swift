
import Foundation

// MARK: - EditContactInteractorProtocol
protocol EditContactInteractorProtocol {
    func viewDidLoad()
    var presenter: EditContactPresentationProtocol? { get set }
    var contact: Contact { get }
    
}

// MARK: - EditContactInteractor
class EditContactInteractor {
    var presenter: EditContactPresentationProtocol?
    var contact: Contact
    init(presenter: EditContactPresentationProtocol, contact: Contact) {
        self.presenter = presenter
        self.contact = contact
    }
}

// MARK: - EditContactInteractor delegates
extension EditContactInteractor: EditContactInteractorProtocol {
    
    func viewDidLoad() {
        self.presenter?.presentContactDetail(response: .init(contact: self.contact))
    }
}
