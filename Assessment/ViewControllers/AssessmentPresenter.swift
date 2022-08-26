


import Foundation

// MARK: - Presentation Protocol
protocol AssessmentPresentationProtocol {
    func presentProfile(response: AssessmentViewController.Assessment.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class AssessmentPresenter {
    weak var viewController: AssessmentDisplayLogic?
    init(viewController: AssessmentDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension AssessmentPresenter: AssessmentPresentationProtocol {
    
    func presentProfile(response: AssessmentViewController.Assessment.ViewData) {
        viewController?.displayUserProfile(viewData: response)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
        
    }
}
