//
//  FirstViewOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import Foundation

protocol FirstViewOutput {
    func viewLoaded()
	func numberOfRows() -> Int
	func configure(cell: SomeTableViewCellProtocol, at index: Int)
	func openMessage(index: Int)
	func openSecondTab()
}
