//
//  SecondModuleConfigurator.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import UIKit

final class SecondModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> (view: SecondViewController, presenter: SecondPresenter) {
        let view = SecondViewController()
        let presenter = SecondPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
