//
//  SecondModuleOutput.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

enum SecondOutputModel {
    case success 
}

typealias SecondOutputBlock = (SecondOutputModel) -> Void

protocol SecondModuleOutput: AnyObject {
    var onFinish: SecondOutputBlock? { get set }
}
