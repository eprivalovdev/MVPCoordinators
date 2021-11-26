//
//  FirstModuleOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

enum FirstOutputModel {
    case success
	case showMessage(_ message: String)
	case openSeconTab
}

typealias FirstOutputBlock = (FirstOutputModel) -> Void

protocol FirstModuleOutput: AnyObject {
    var onFinish: FirstOutputBlock? { get set }
}
