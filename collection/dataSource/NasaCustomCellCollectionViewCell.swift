//  
//  NasaCustomCellCollectionViewCell.swift
//  collection
//
//  Created by Michael de Guzman on 12/21/23.
//

import UIKit
import Kingfisher


protocol NasaCustomCellCollectionViewCellDisplayData {
	
	var title: String { get }
	var explanation: String { get }
	var url: String { get }
}

class NasaCustomCellCollectionViewCell: UICollectionViewCell {
	
	
	// MARK: - Outlets

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var explanationTextView: UITextView!
	// MARK: - Init
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imageView.kf.cancelDownloadTask()
		imageView.image = nil
		
	}
	
}

extension NasaCustomCellCollectionViewCell {
	
	func configure(withDisplayData displayData: NasaCustomCellCollectionViewCellDisplayData) {
		titleLabel.text = displayData.title
		imageView.kf.setImage(with: URL(string: displayData.url))
		explanationTextView.text = displayData.explanation
	}
	
}
