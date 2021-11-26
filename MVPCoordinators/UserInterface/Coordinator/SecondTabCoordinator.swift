//
//  SecondTabCoordinator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

class SecondTabCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	var onFinishFlow: (() -> Void)?
	
	let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showBank()
	}
	
	func showBank() {
		let (view, _) = SecondModuleConfigurator().configure()
//		output.onFinish = { [weak self] model in
//
//		}
		navigationController.setViewControllers([view], animated: false)
	}
}
