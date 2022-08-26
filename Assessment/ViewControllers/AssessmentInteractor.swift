

import Foundation
// MARK: - AssessmentInteractorProtocol
protocol AssessmentInteractorProtocol {
    func viewDidLoad()
    var presenter: AssessmentPresentationProtocol? { get set }
}

// MARK: - AssessmentInteractor
class AssessmentInteractor {
    var presenter: AssessmentPresentationProtocol?
    init(presenter: AssessmentPresentationProtocol) {
        self.presenter = presenter
    }
    
   
}

// MARK: - AssessmentInteractor delegates
extension AssessmentInteractor: AssessmentInteractorProtocol {
    
    func viewDidLoad() {
       
    }
}
