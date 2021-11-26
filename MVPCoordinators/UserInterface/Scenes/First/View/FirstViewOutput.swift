//
//  FirstViewOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

protocol FirstViewOutput {
	var messages: [SomeTableViewCellViewModel] { get }
    func viewLoaded()
	func openMessage(index: Int)
	func openSecondTab()
}
