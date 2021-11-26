//
//  MainCoordinator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
	
	var childCoordinators: [Coordinator] = []

	var onFinishFlow: (() -> Void)?

	let tabBarController: MainTabBarController
	
	init(tabBarController: MainTabBarController) {
		self.tabBarController = tabBarController
		super.init()
		tabBarController.delegate = self
	}
	
	func start() {
		performFirstFlow()
	}
	
	func performFirstFlow() {
		let navigationController = tabBarController.navigationController(of: .main)
		guard navigationController.viewControllers.isEmpty else { return }
        let coordinator = FirstTabCoordinator(navigationController: navigationController)
		coordinator.onFinishFlow = { [weak self] output in
			switch output {
			case .openSecondTab:
				self?.performSecondFlow()
				self?.tabBarController.selectedTab = .catalog
			}
		}
        addDependency(coordinator)
        coordinator.start()
	}
	
	func performSecondFlow() {
		let navigationController = tabBarController.navigationController(of: .catalog)
		guard navigationController.viewControllers.isEmpty else { return }
		let coordinator = SecondTabCoordinator(navigationController: navigationController)
		addDependency(coordinator)
		coordinator.start()
	}
}

// MARK: - UITabBarControllerDelegate

extension MainCoordinator: UITabBarControllerDelegate {
	
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		guard let tab = MainTab(rawValue: viewController.tabBarItem.tag) else { return }
		switch tab {
		case .main:
			performFirstFlow()
		case .catalog:
			performSecondFlow()
		}
	}
}
