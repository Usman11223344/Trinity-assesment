

import Foundation
import UIKit

// MARK: - Assessment Router Protocol
protocol AssessmentRouter: AnyObject {
    func start()
}

// MARK: - AssessmentCoordinator Class
class AssessmentCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Routing
extension AssessmentCoordinator: AssessmentRouter {
    
    func start() {
        let viewController = AssessmentViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = AssessmentInteractor(presenter: AssessmentPresenter(viewController: viewController))
        viewController.router = self
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
}
