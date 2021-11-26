//
//  ThirdModuleConfigurator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import UIKit

final class ThirdModuleConfigurator {

    // MARK: - Internal methods
	func configure(withMessage message: String) -> (view: ThirdViewController, presenter: ThirdPresenter) {
        let view = ThirdViewController()
        let presenter = ThirdPresenter(message: message)

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
