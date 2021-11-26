//
//  FirstTabCoordinator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

class FirstTabCoordinator: Coordinator {
	
	enum Output {
		case openSecondTab
	}
	
	var childCoordinators: [Coordinator] = []
	
	var onFinishFlow: ((Output) -> Void)?
	
	let navigationController: UINavigationController
    
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showFirstViewController()
	}
	
    func showFirstViewController() {
        let (view, output) = FirstModuleConfigurator().configure()
        output.onFinish = { [weak self] model in
			switch model {
			case .success:
				print("success")
			case let .showMessage(message):
				self?.showThirdViewController(withMessage: message)
			case .openSeconTab:
				self?.onFinishFlow?(.openSecondTab)
			}
		}
		navigationController.setViewControllers([view], animated: true)
    }
	
	func showThirdViewController(withMessage message: String) {
		let (view, output) = ThirdModuleConfigurator().configure(withMessage: message)
		output.onFinish = { [weak self] model in
			switch model {
			case .back:
				self?.navigationController.popViewController(animated: true)
			}
		}
		navigationController.pushViewController(view, animated: true)
	}
}
