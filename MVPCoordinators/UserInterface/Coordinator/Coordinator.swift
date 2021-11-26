//
//  Coordinator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 28.07.2020.
//  Copyright © 2020 Егор Привалов. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }
	func addDependency(_ coordinator: Coordinator)
	func removeDependency(_ coordinator: Coordinator?)
	
	func start()
}

extension Coordinator {
	func addDependency(_ coordinator: Coordinator) {
		guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
		childCoordinators.append(coordinator)
	}

	func removeDependency(_ coordinator: Coordinator?) {
		childCoordinators.removeAll(where: { $0 === coordinator })
	}
}
