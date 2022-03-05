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
		
		let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 20
		
		let width = (view.frame.width - layout.minimumInteritemSpacing) / 2
		layout.itemSize = CGSize(width: width, height: width * 1.5)
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
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieGridCell.identifier,
													  for: indexPath) as! MovieGridCell
		
		let movie = movies[indexPath.item]
		cell.configure(with: movie)
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let cell = sender as! UICollectionViewCell
		let indexPath = collectionView.indexPath(for: cell)!
		let movie = movies[indexPath.item]
		
		let movieDetailView = segue.destination as! MovieDetailsViewController
		movieDetailView.movie = movie
		
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
