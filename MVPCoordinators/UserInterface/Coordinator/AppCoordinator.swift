//
//  AppCoordinator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

enum LaunchConfiguration {
	case start
	case main
	case debug
}

class AppCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	let window: UIWindow
		
	var launchConfiguration: LaunchConfiguration {
//		switch userStatus {
//		case .debug:
//			return .debug
//		case .start:
			return .start
//		case .main:
//			return .main
//		}
	}
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		performMainFlow()
		window.makeKeyAndVisible()
	}
	
	private func performMainFlow() {
		let tabBarController = MainTabBarController()
		window.rootViewController = tabBarController
		let coordinator = MainCoordinator(tabBarController: tabBarController)
		coordinator.onFinishFlow = { [weak self, weak coordinator] in
			self?.removeDependency(coordinator)
			self?.start()
		}
		addDependency(coordinator)
		coordinator.start()
	}
}
