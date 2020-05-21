//
//  ViewController.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/20.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!

    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fetchInterestingPhotos {
            (photosResult) in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
               
                self.photoDataSource.photos = photos
                
                
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                
                self.photoDataSource.photos.removeAll()
            }
            
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
    }
}

