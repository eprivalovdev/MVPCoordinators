//
//  ThirdViewOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

protocol ThirdViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()
	func backButtonTap()
}
