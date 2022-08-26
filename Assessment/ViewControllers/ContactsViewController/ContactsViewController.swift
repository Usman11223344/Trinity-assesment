
import UIKit

// MARK: - Master Display Protocol
protocol ContactsDisplayLogic: AnyObject {
    func displayContacts(viewData: ContactsViewController.Contacts.ViewData)
    func displayError(errorString: String)
}

class ContactsViewController: UIViewController {

    // MARK: - Properties
    var interactor: ContactsInteractorProtocol?
    weak var router: ContactsRouter?
    var viewData: Contacts.ViewData?
    // MARK: - Models
    enum Contacts {
        
        struct ViewData {
            var section: Section
        }
        
        struct Section {
                        
            var rows: [Row]
            
            var count: Int {
                return rows.count
            }
            
            subscript(_ index: Int) -> Row {
                return rows[index]
            }
        }
        
        struct Row {
            var contact: Contact
        }

    }
    
    // MARK: - IBOutlets
    let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identifier)
        }
    }
    
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPullToRefresh()
        interactor?.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func addContactAction(_ sender: Any) {
    }
    
    @IBAction func refresh(_ sender: AnyObject) {
        interactor?.viewDidLoad()
        refreshControl.endRefreshing()
    }
    
    // MARK: - Helping Methods
    private func set(viewData: Contacts.ViewData) {
        self.viewData = viewData
        self.tableView.reloadData()
    }
    
    private func setUpPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
}

// MARK: - ContactsViewControllerDisplayLogic
extension ContactsViewController: ContactsDisplayLogic {

    func displayContacts(viewData: Contacts.ViewData) {
        self.set(viewData: viewData)
    }
    
    func displayError(errorString: String) {
    }

}

// MARK: - UITableViewDelegate
extension ContactsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewData = self.viewData else { return }
        let section = viewData.section
        let rows = section.rows
        let row = rows[indexPath.row]
        router?.showEditContactViewController(from: self, withContact: row.contact)
    }

}

// MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewData = self.viewData else { return 0 }
        return viewData.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewData = self.viewData else { return 0 }
        return viewData.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier) as! ContactTableViewCell
        guard let viewData = self.viewData else { return UITableViewCell() }
        let section = viewData.section
        let rows = section.rows
        let row = rows[indexPath.row]
        cell.set(contact: .init(contact: row.contact))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }

}

// MARK: - ContactsViewControllerDisplayLogic
extension ContactsViewController: EditContactDelegate {
    
    func updateContact(contact: Contact) {
        guard let viewData = self.viewData else { return }
        let rows = viewData.section.rows
        let index = rows.firstIndex { object in
            guard let contactId = object.contact.conatctId, contactId.count > 0 else { return false }
            return (contactId == contact.conatctId ?? "")
        }
        guard let contactIndex = index else { tableView.reloadData();return }
        self.viewData?.section.rows[contactIndex] = .init(contact: contact)
        tableView.reloadData()
    }
}
