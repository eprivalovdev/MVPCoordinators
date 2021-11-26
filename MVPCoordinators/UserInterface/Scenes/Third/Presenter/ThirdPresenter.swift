//
//  ThirdPresenter.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

final class ThirdPresenter: ThirdModuleOutput {

    // MARK: - Properties
    weak var view: ThirdViewInput?

    var onFinish: ThirdOutputBlock?
	
	private let message: String

	init(message: String) {
		self.message = message
	}
}

// MARK: - ThirdViewOutput
extension ThirdPresenter: ThirdViewOutput {
	
    func viewLoaded() {
        view?.setupView(message)
    }
	
	func backButtonTap() {
		onFinish?(.back)
	}
}
