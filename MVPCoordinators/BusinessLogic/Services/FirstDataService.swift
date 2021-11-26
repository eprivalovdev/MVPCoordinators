//
//  FirstDataService.swift
//  MVPCoordinators
//
//  Created by Егор Привалов on 20.05.2021.
//

import Foundation

protocol FirstDataServicing {
	func loadData(completion: @escaping (Result<[FirstResponseModel], Error>) -> Void)
}

class FirstDataService: FirstDataServicing {
	
	func loadData(completion: @escaping (Result<[FirstResponseModel], Error>) -> Void) {
		// request
		let someArray = [
			FirstResponseModel(id: 0, title: "Один"),
			FirstResponseModel(id: 1, title: "Два"),
			FirstResponseModel(id: 2, title: "Три")
		]
		
		completion(.success(someArray))
	}
}
