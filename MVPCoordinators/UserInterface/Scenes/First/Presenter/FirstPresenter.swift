//
//  FirstPresenter.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

final class FirstPresenter: FirstModuleOutput {

    // MARK: - Properties
    weak var view: FirstViewInput?

    var onFinish: FirstOutputBlock?
	
	private let dataService: FirstDataServicing = FirstDataService()
	
	private var messages: [SomeTableViewCellViewModel] = []
	
	private func loadData() {
		dataService.loadData { [weak self] result in
			guard let self = self else { return }
			switch result {
			case let .success(response):
				self.messages = response.map({ SomeTableViewCellViewModel(title: $0.title) })
				self.view?.displayData()
			case .failure:
				break
			}
		}
	}
}

// MARK: - FirstViewOutput
extension FirstPresenter: FirstViewOutput {

    func viewLoaded() {
        view?.setupView()
		loadData()
    }
	
	func numberOfRows() -> Int {
		return messages.count
	}
	
	func configure(cell: SomeTableViewCellProtocol, at index: Int) {
		cell.fill(message: messages[index])
	}
	
	func openMessage(index: Int) {
		onFinish?(.showMessage(messages[index].title))
	}
	
	func openSecondTab() {
		onFinish?(.openSeconTab)
	}
}
