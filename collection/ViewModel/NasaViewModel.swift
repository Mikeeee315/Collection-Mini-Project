//
//  NasaViewModel.swift
//  collection
//
//  Created by Michael de Guzman on 12/21/23.
//

import Foundation


class NasaViewModel {
	private var nasaItemModel: [NasaItemModel] = []
	
	func fetchData(completion: @escaping () -> Void) {
		// Use URLSession or a networking library to fetch data from the NASA API
		let apiUrl = Config.shared.baseURL.absoluteString + Config.shared.apiKey
		
		guard let url = URL(string: apiUrl) else {
			completion()
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let data = data {
				do {
					let decoder = JSONDecoder()
					let nasaItemModel = try decoder.decode(NasaItemModel.self, from: data)
					self.nasaItemModel.append(nasaItemModel)
					completion()
				} catch {
					print("Error decoding JSON: \(error)")
					completion()
				}
			}
		}.resume()
	}
	
	func numberOfItems() -> Int {
		return nasaItemModel.count
	}
	
	func item(at index: Int) -> NasaItemModel {
		return nasaItemModel[index]
	}
}
