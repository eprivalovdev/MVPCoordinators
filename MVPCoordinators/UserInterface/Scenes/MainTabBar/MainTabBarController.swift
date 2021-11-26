//
//  MainTabBarController.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

class MainTabBarController: UITabBarController {
	
	var selectedTab: MainTab {
		get {
			MainTab(rawValue: selectedIndex)!
		}
		set {
			selectedIndex = newValue.rawValue
		}
	}
		
	init() {
		super.init(nibName: nil, bundle: nil)
        configureControllers()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
	
	func navigationController(of tab: MainTab) -> UINavigationController {
		viewControllers?[tab.rawValue] as! UINavigationController
	}
	
    private func configureAppearance() {
		tabBar.barTintColor = .white
		tabBar.tintColor = .black
		tabBar.unselectedItemTintColor = .lightGray
        tabBar.shadowImage = UIImage()
    }

    private func configureControllers() {
        var controllers: [UIViewController] = []
        for tab in MainTab.allCases {
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            tabBarItem.tag = tab.rawValue

            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabBarItem
            controllers.append(navigationController)
        }
        viewControllers = controllers
    }
}
