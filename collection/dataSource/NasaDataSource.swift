//
//  NasaDataSource.swift
//  collection
//
//  Created by Michael de Guzman on 12/21/23.
//

import UIKit
import Foundation
class NasaDataSource: NSObject {
	
	typealias DataType = NasaCustomCellCollectionViewCellDisplayData
	typealias TableViewCellType = NasaCustomCellCollectionViewCell
	// MARK: - Init

	var viewModel = NasaViewModel()
	let collectionView: UICollectionView

	init(forCollectionView collectionView: UICollectionView, viewModel: NasaViewModel) {
		self.collectionView = collectionView
		self.viewModel = viewModel
		super.init()
		
	}
	
}

extension NasaDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewModel.numberOfItems()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomViewCell", for: indexPath) as! TableViewCellType
	
		let NasaItemModel = self.viewModel.item(at: indexPath.row)
		cell.configure(withDisplayData: NasaItemModel)
		
		return cell
	}
}
