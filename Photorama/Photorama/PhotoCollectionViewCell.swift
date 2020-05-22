//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/21.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            spinner.hidesWhenStopped = true
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil 
        }
    }
    
}
