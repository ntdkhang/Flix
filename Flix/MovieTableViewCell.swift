//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/23/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

	@IBOutlet weak var movieOverviewLabel: UILabel!
	@IBOutlet weak var movieTitleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
