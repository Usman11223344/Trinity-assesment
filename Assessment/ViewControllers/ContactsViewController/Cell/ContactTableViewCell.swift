
import UIKit

class ContactTableViewCell: UITableViewCell {
    
    static let identifier: String = "ContactTableViewCell"
    static var nib: UINib? {
        UINib(nibName: "ContactTableViewCell", bundle: nil)
    }
    
    //MARK: - View Data
    struct ViewData {
        let contact: Contact
    }
    

    //MARK: - @IBOutlet
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactImageView.makeRounded()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(contact: ContactTableViewCell.ViewData) {
        contactNameLabel.text = "\(contact.contact.firstName ?? "") \(contact.contact.lastName ?? "")"
    }
    
}
