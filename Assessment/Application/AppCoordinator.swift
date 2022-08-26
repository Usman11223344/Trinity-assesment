
import Foundation
import UIKit

// MARK: - AppRouter Protocol
protocol AppRouter: AnyObject {
    func start()
}

final class AppCoordinator {
    
    private var window: UIWindow
    private var assessmentCoordinator: AssessmentCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Private Methods
    private func showAssessmentController() {
        self.assessmentCoordinator = AssessmentCoordinator.init(window: window)
        self.assessmentCoordinator?.start()
    }
}

// MARK: - AppRouter Delegates
extension AppCoordinator: AppRouter {
    
    func start() {
        self.window.backgroundColor = .white
        if #available(iOS 13.0, *) {
            self.window.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.window.makeKeyAndVisible()
        showAssessmentController()
    }
}
