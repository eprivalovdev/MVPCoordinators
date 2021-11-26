//
//  SecondViewController.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Properties
    var output: SecondViewOutput?

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }
}

// MARK: - SecondViewInput
extension SecondViewController: SecondViewInput {
    func setupView() {
		view.backgroundColor = .yellow
    }
}
