//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/22.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: FlickrPhoto! {
        didSet {
            navigationItem.title = photo.title
        }
    }
        var store: PhotoStore!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
}
