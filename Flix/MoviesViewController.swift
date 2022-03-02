//
//  MoviesViewController.swift
//  Flix
//
//  Created by Nguyen Tran Duy Khang on 2/21/22.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource,
							UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	
	private var movies = [Movie]() {
		didSet {
			tableView.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		tableView.rowHeight = 122
		MovieService.shared.fetchMovies { movies in
			self.movies = movies
		}
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell
		else {
			return UITableViewCell()
		}
		
		let movie = movies[indexPath.row]
		cell.configure(with: movie)
		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let cell = sender as! UITableViewCell
		let indexPath = tableView.indexPath(for: cell)!
		let movie = movies[indexPath.row]
		let detailsViewController = segue.destination as! MovieDetailsViewController
		detailsViewController.movie = movie
		tableView.deselectRow(at: indexPath, animated: false)

	}
}

