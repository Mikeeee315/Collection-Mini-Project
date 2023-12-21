//
//  NasaItemModel.swift
//  collection
//
//  Created by Michael de Guzman on 12/21/23.
//


import Foundation

struct NasaItemModel: Codable {
	let title: String
	let explanation: String
	let url: String
	// Add any other properties you need
}

extension NasaItemModel: NasaCustomCellCollectionViewCellDisplayData {
	
}
