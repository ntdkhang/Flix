//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 3/3/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource,
							   UICollectionViewDelegate {
	
	
	
	var movies = [Movie]() {
		didSet {
			collectionView.reloadData()
		}
	}
	
	@IBOutlet weak var collectionView: UICollectionView!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		MovieService.shared.fetchMovies(.superhero) { movies in
			self.movies = movies
			print(movies)
		}
        // Do any additional setup after loading the view.
    }
	
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieGridCell.identifier, for: indexPath) as! MovieGridCell
		
		let movie = movies[indexPath.item]
		cell.configure(with: movie)
		return cell
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
