//
//  ThirdModuleOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

enum ThirdOutputModel {
	case back
}

typealias ThirdOutputBlock = (ThirdOutputModel) -> Void

protocol ThirdModuleOutput: AnyObject {
    var onFinish: ThirdOutputBlock? { get set }
}
