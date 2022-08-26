
import Foundation

// MARK: - ContactsInteractorProtocol
protocol ContactsInteractorProtocol {
    func viewDidLoad()
    var presenter: ContactsPresentationProtocol? { get set }
}

// MARK: - ContactsInteractor
class ContactsInteractor {
    var presenter: ContactsPresentationProtocol?
    init(presenter: ContactsPresentationProtocol) {
        self.presenter = presenter
    }
    
   
}

// MARK: - ContactsInteractor delegates
extension ContactsInteractor: ContactsInteractorProtocol {
    
    func viewDidLoad() {
        
        guard let path = Bundle.main.path(forResource: "data", ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe), let response = try? JSONDecoder().decode([Contact].self, from: data) else {
            self.presenter?.presentError(errorString: "No data found")
            return
        }
        
        var rows: [ContactsViewController.Contacts.Row] = []
        for contact in response {
            rows.append(.init(contact: contact))
        }
        self.presenter?.presentProfile(response: ContactsViewController.Contacts.ViewData.init(section: .init(rows: rows)))
    }
}
