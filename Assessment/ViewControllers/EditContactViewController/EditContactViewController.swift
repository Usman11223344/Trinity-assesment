
import UIKit

// MARK: - EditContact
protocol EditContactDelegate: AnyObject {
    func updateContact(contact: Contact)
}

// MARK: - Master Display Protocol
protocol EditContactDisplayLogic: AnyObject {
    func displayContactDetail(viewData: EditContactViewController.EditContact.ViewData)
    func displayError(errorString: String)
}

class EditContactViewController: UIViewController {

    // MARK: - Properties
    var interactor: EditContactInteractorProtocol?
    weak var router: EditContactRouter?
    var viewData: EditContact.ViewData?
    // MARK: - Models
    enum EditContact {
        
        struct ViewData {
            let contact: Contact
        }
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField.delegate = self
        }
    }
    
    @IBOutlet weak var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField.delegate = self
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    @IBOutlet weak var phoneTextField: UITextField! {
        didSet {
            phoneTextField.delegate = self
        }
    }
    
    var delegate: EditContactDelegate?
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    // MARK: - Helping Methods
    private func set(viewData: EditContact.ViewData) {
        self.viewData = viewData
        let contact = viewData.contact
        firstNameTextField.text = contact.firstName
        lastNameTextField.text = contact.lastName
        emailTextField.text = contact.email
        phoneTextField.text = contact.phone
    }

    // MARK: - Actions
    @IBAction func saveAction(_ sender: Any) {
        saveContactDetail()
        popViewController()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        popViewController()
    }
    
    // MARK: - Helping Method
    func saveContactDetail() {
        
        guard let interactor = self.interactor else { return }
        
        guard let firstName = firstNameTextField.text, firstName.trim.count > 0 else {
            showToast(message: "First name could not be empty")
            return
        }
        guard let lastName = lastNameTextField.text, lastName.trim.count > 0 else {
            showToast(message: "Last name could not be empty")
            return
        }
        let email = emailTextField.text?.trim
        let phone = phoneTextField.text?.trim
        
        var contact = interactor.contact
        contact.firstName = firstName
        contact.lastName = lastName
        contact.email = email
        contact.phone = phone
        self.delegate?.updateContact(contact: contact)
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - AssessmentViewControllerDisplayLogic
extension EditContactViewController: EditContactDisplayLogic {

    func displayContactDetail(viewData: EditContact.ViewData) {
        self.set(viewData: viewData)
    }
    
    func displayError(errorString: String) {
    }

}

// MARK: - AssessmentViewControllerDisplayLogic
extension EditContactViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
            break
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            phoneTextField.becomeFirstResponder()
            break
        default:
            phoneTextField.resignFirstResponder()
            break
        }
        return true
    }
}
