//
//  ViewController.swift
//  FlickrDemo
//
//  Created by Xiaochun Shen on 2020/5/26.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet private var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
        
    }


}

