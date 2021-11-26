//
//  MainTab.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

enum MainTab: Int, CaseIterable {

	case main
	case catalog

	// MARK: - Properties

	var title: String {
		switch self {
		case .main:
			return "Главная"
		case .catalog:
			return "Витрина"
		}
	}

	var image: UIImage {
		switch self {
		case .main:
			return UIImage(named: "homeActive")!
		case .catalog:
			return UIImage(named: "category")!
		}
	}

	var selectedImage: UIImage {
		return image
	}
}
