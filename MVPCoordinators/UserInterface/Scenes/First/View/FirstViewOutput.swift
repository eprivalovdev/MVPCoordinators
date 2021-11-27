//
//  FirstViewOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import Foundation

protocol FirstViewOutput {
	var messages: [SomeTableViewCellViewModel] { get }
    func viewLoaded()
	func configure(cell: SomeTableViewCellProtocol, at index: Int)
	func openMessage(index: Int)
	func openSecondTab()
}
