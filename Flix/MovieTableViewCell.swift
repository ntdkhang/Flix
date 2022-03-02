//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/23/22.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
	static let identifier: String = "MovieTableViewCell"
	@IBOutlet weak var movieTitleLabel: UILabel!
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var movieOverviewLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configure(with movie: Movie) {
		print(movie.title)
		
		movieTitleLabel.text? = movie.title
		movieOverviewLabel.text = movie.overview
		movieImageView.af.setImage(withURL: movie.posterURL)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		movieTitleLabel.text?.removeAll()
		movieOverviewLabel.text?.removeAll()
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
