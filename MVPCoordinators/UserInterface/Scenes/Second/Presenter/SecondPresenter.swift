//
//  SecondPresenter.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//    
//

final class SecondPresenter: SecondModuleOutput {

    // MARK: - Properties
    weak var view: SecondViewInput?

    var onFinish: SecondOutputBlock?

}

// MARK: - SecondViewOutput
extension SecondPresenter: SecondViewOutput {
    func viewLoaded() {
        view?.setupView()
    }
}
