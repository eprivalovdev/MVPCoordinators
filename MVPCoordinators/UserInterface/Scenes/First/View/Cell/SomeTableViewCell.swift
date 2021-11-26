//
//  SomeTableViewCell.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20/05/2021.
//
//

import UIKit

class SomeTableViewCell: ReusableTableViewCell {

	private lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.textColor = .black
		lbl.font = .systemFont(ofSize: 16, weight: .regular)
		return lbl
	}()
	
	private lazy var separatorView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gray
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		contentView.addSubviews(
			titleLabel,
			separatorView
		)
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor == contentView.leadingAnchor + 20,
			titleLabel.topAnchor == contentView.topAnchor + 10,
			titleLabel.trailingAnchor == contentView.trailingAnchor - 20,
			titleLabel.bottomAnchor == contentView.bottomAnchor - 10,
			
			separatorView.leadingAnchor == contentView.leadingAnchor + 20,
			separatorView.trailingAnchor == contentView.trailingAnchor - 20,
			separatorView.bottomAnchor == contentView.bottomAnchor,
			separatorView.heightAnchor == 1
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		titleLabel.text = nil
	}
	
	// MARK: - Methods
	func fill(message: SomeTableViewCellViewModel) {
		titleLabel.text = message.title
	}
}
