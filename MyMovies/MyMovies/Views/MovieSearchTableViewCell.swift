//
//  MovieSearchTableViewCell.swift
//  MyMovies
//
//  Created by Michael Stoffer on 7/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieSearchTableViewCell: UITableViewCell {

    // Mark: - IBOutlets and Properties
    @IBOutlet var movieSearchTitle: UILabel!
    
    weak var delegate: MovieSearchTableViewCellDelegate?
    
    // Mark: - IBActions and Methods
    @IBAction func saveMovieToMyMovies(_ sender: Any) {
        delegate?.saveMovieToMyMovies(for: self)
    }
    
}
