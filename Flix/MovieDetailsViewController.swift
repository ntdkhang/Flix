//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 3/2/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
	var movie: Movie!
	
	@IBOutlet weak var movieOverview: UILabel!
	@IBOutlet weak var moviePoster: UIImageView!
	@IBOutlet weak var movieBackdrop: UIImageView!
	@IBOutlet weak var movieTitle: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()

		movieTitle.text = movie.title
		movieOverview.text = movie.overview
		moviePoster.af.setImage(withURL: movie.posterURL)
		movieBackdrop.af.setImage(withURL: movie.backdropURL)
        // Do any additional setup after loading the view.
    }
    
	
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
