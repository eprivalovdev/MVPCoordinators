//
//  AppDelegate.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20.05.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	var coordinator: AppCoordinator!
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		coordinator = AppCoordinator(window: window!)
		
		coordinator.start()
		return true
	}
}
