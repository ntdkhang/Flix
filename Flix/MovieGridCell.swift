//
//  MovieGridCell.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 3/3/22.
//

import UIKit
import AlamofireImage

class MovieGridCell: UICollectionViewCell {
	static let identifier = "MovieGridCell"
	@IBOutlet weak var posterView: UIImageView!
	
	func configure(with movie: Movie) {
		posterView.af.setImage(withURL: movie.posterURL)
	}
}
