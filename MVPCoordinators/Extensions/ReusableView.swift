//
//  ReusableView.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20.05.2021.
//

import UIKit

protocol ReusableView: NSObjectProtocol {
	static var reuseID: String { get }
}

extension ReusableView {
	
	static var reuseID: String {
		String(describing: Self.self)
	}
}

extension UITableView {
	
	func register(cell: ReusableView.Type) {
		register(cell, forCellReuseIdentifier: cell.reuseID)
	}
	
	func register(headerFooterView: ReusableView.Type) {
		register(headerFooterView, forHeaderFooterViewReuseIdentifier: headerFooterView.reuseID)
	}
	
	func dequeueCell<CellType: ReusableView>(for indexPath: IndexPath) -> CellType {
		return dequeueReusableCell(withIdentifier: CellType.reuseID, for: indexPath) as! CellType
	}
	
	func dequeueHeaderFooter<HeaderFooterType: ReusableView>() -> HeaderFooterType {
		return dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterType.reuseID) as! HeaderFooterType
	}
}

extension UICollectionView {
	
	func register(cell: ReusableView.Type) {
		register(cell, forCellWithReuseIdentifier: cell.reuseID)
	}
	
	func dequeueCell<CellType: ReusableView>(for indexPath: IndexPath) -> CellType {
		return dequeueReusableCell(withReuseIdentifier: CellType.reuseID, for: indexPath) as! CellType
	}
}

class ReusableTableViewCell: UITableViewCell, ReusableView {}
class ReusableCollectionViewCell: UICollectionViewCell, ReusableView {}
class ReusableTableHeaderFooterView: UITableViewHeaderFooterView, ReusableView {}

