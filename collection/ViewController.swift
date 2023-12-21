//
//  ViewController.swift
//  collection
//
//  Created by Michael de Guzman on 12/21/23.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Outlet

	@IBOutlet weak var collectionView: UICollectionView!
	
	// MARK: - Private
	private let viewModel = NasaViewModel()
	private lazy var dataSource = NasaDataSource(forCollectionView: collectionView, viewModel: viewModel)
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		collectionView.dataSource = dataSource
		collectionView.delegate = dataSource

		// Fetch NASA data using your API key
		viewModel.fetchData {
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
		
	}
	
	
}
