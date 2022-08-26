
import UIKit

// MARK: - Master Display Protocol
protocol AssessmentDisplayLogic: AnyObject {
    func displayUserProfile(viewData: AssessmentViewController.Assessment.ViewData)
    func displayError(errorString: String)
}

// MARK: - AssessmentViewController
class AssessmentViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: AssessmentInteractorProtocol?
    weak var router: AssessmentRouter?
    var viewData: Assessment.ViewData?
    // MARK: - Models
    enum Assessment {
        
        struct ViewData {
            let section: Section
        }
        
        struct Section {
                        
            let rows: [Row]
            
            var count: Int {
                return rows.count
            }
            
            subscript(_ index: Int) -> Row {
                return rows[index]
            }
        }
        
        struct Row {
//            let programCellData: FreeProgramTableViewCell.ViewData
        }

    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - Helping Methods
    private func set(viewData: Assessment.ViewData) {
        self.viewData = viewData
    }


}
// MARK: - AssessmentViewControllerDisplayLogic
extension AssessmentViewController: AssessmentDisplayLogic {

    func displayUserProfile(viewData: AssessmentViewController.Assessment.ViewData) {
        self.set(viewData: viewData)
    }
    
    func displayError(errorString: String) {
    }

}

