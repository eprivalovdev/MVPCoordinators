//
//  FirstModuleConfigurator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import UIKit

final class FirstModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (view: FirstViewController, presenter: FirstPresenter) {
        let view = FirstViewController()
        let presenter = FirstPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
