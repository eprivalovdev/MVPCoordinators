//
//  UIView+Extensions.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20.05.2021.
//

import UIKit

extension UIView {
	func addSubviews(_ views: UIView...) {
		for view in views {
			addSubview(view)
		}
	}
}
