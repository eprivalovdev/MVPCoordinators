//
//  FirstViewController.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

final class FirstViewController: UIViewController {
	
	// MARK: - Properties
	var output: FirstViewOutput?
	
	private lazy var catalogButton: UIBarButtonItem = {
		let button = UIBarButtonItem(image: UIImage(named: "category")?.withRenderingMode(.alwaysOriginal),
									 style: .plain,
									 target: self,
									 action: #selector(onCatalogButtonTap))
		return button
	}()
	
	private lazy var tableView: UITableView = {
		let tbl = UITableView()
		tbl.translatesAutoresizingMaskIntoConstraints = false
		tbl.backgroundColor = .white
		tbl.separatorStyle = .none
		tbl.delegate = self
		tbl.dataSource = self
		tbl.register(cell: SomeTableViewCell.self)
		return tbl
	}()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }
	
	@objc
	private func onCatalogButtonTap(_ sender: UIBarButtonItem) {
		output?.openSecondTab()
	}
}

// MARK: - FirstViewInput
extension FirstViewController: FirstViewInput {
	
    func setupView() {
		
		navigationItem.rightBarButtonItem = catalogButton
		
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			tableView.leadingAnchor == view.leadingAnchor,
			tableView.topAnchor == view.topAnchor,
			tableView.trailingAnchor == view.trailingAnchor,
			tableView.bottomAnchor == view.bottomAnchor,
		])
    }
	
	func displayData() {
		tableView.reloadData()
	}
}


extension FirstViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return output?.messages.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: SomeTableViewCell = tableView.dequeueCell(for: indexPath)
		output?.configure(cell: cell, at: indexPath.row)
		return cell
	}
}

extension FirstViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		output?.openMessage(index: indexPath.row)
	}
}
