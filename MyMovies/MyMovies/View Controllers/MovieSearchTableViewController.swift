//
//  MovieSearchTableViewController.swift
//  MyMovies
//
//  Created by Spencer Curtis on 8/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        movieController.searchForMovie(with: searchTerm) { (error) in
            
            guard error == nil else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.searchedMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieSearchTableViewCell else { return UITableViewCell() }

        cell.movieSearchTitle.text = self.movieController.searchedMovies[indexPath.row].title
        cell.delegate = self
        
        return cell
    }
    
    var movieController = MovieController()
    
    @IBOutlet weak var searchBar: UISearchBar!
}

extension MovieSearchTableViewController: MovieSearchTableViewCellDelegate {
    func saveMovieToMyMovies(for cell: MovieSearchTableViewCell) {
        guard let title = cell.movieSearchTitle.text else { return }        
        self.movieController.createMovie(withTitle: title)
    }
}
