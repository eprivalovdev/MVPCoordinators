//
//  ThirdViewController.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

import UIKit

final class ThirdViewController: UIViewController {

    // MARK: - Properties
    var output: ThirdViewOutput?
	
	private lazy var backButton: UIBarButtonItem = {
		let button = UIBarButtonItem(image:  UIImage(named: "homeActive")?.withRenderingMode(.alwaysOriginal),
									 style: .plain,
									 target: self,
									 action: #selector(onBackButtonTap))
		return button
	}()
	
	private lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.textColor = .black
		lbl.textAlignment = .center
		lbl.font = .systemFont(ofSize: 20, weight: .bold)
		return lbl
	}()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = backButton
		
        output?.viewLoaded()
    }
	
	@objc
	private func onBackButtonTap(_ sender: UIBarButtonItem) {
		output?.backButtonTap()
	}
}

// MARK: - ThirdViewInput
extension ThirdViewController: ThirdViewInput {
	
	func setupView(_ message: String) {
		titleLabel.text = message
		
		view.backgroundColor = .white
		
		view.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor == view.leadingAnchor,
			titleLabel.topAnchor == view.topAnchor,
			titleLabel.trailingAnchor == view.trailingAnchor,
			titleLabel.bottomAnchor == view.bottomAnchor,
		])
    }
}
