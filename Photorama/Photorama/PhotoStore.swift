//
//  PhotoStore.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/20.
//  Copyright © 2020 SXC. All rights reserved.
//

import UIKit

enum PhotoError: Error {
    case imageCreateionError
    case missingImageURL
}

class PhotoStore {
    
    let imageStore = ImageStore()
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    func fetchInterestingPhotos(completion: @escaping (Result<[FlickrPhoto], Error>) -> Void) {
        
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
       
            // Bronze Challenge
            self.printHTTPHeader(for: response)
            
            let result = self.processPhotosRequest(data: data, error: error)
            
            OperationQueue.main.addOperation {
                completion(result)
            }
            
        }
        task.resume()
        
    }
    
    private func processPhotosRequest(data: Data?, error: Error?) -> Result<[FlickrPhoto], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    // implementing a method to download image data
    func fetchImage(for photo: FlickrPhoto,
                    completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        let photoKey = photo.photoID
        if let image = imageStore.image(forKey: photoKey) {
            OperationQueue.main.addOperation {
                completion(.success(image))
            }
            return
        }
        guard let photoURL = photo.remoteURL else { completion(.failure(PhotoError.missingImageURL))
        return
        }
        let request = URLRequest(url: photoURL)
        let task = session.dataTask(with: request) {
            (data, response, error)
            in
            
            let result = self.processImageRequest(data: data, error: error)
            
            if case let .success(image) = result {
                self.imageStore.setImage(image, forKey: photoKey)
            }
            
            OperationQueue.main.addOperation {
                completion(result)
            }
            
        }
        task.resume()
    }
    
    // Processing the image request data
    private func processImageRequest(data: Data?, error: Error?) -> Result<UIImage, Error> {
        guard let imageData = data,
        let image = UIImage(data: imageData) else {
            // Couldn't create an image
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(PhotoError.imageCreateionError)
            }
            
        }
        return .success(image)
    }
    
    
    // MARK: - Bronze Challenge: Printing the Response Information
    func printHTTPHeader(for response: URLResponse?) {
        guard let aHTTPURLResponse = response as? HTTPURLResponse else {
            return
        }
        
        let statusCode = aHTTPURLResponse.statusCode
        print("HTTP Status Code: \(statusCode)")
        print("Message: \(HTTPURLResponse.localizedString(forStatusCode: statusCode))")
        print("All HTTP Header Fields:")
        for (key, value) in aHTTPURLResponse.allHeaderFields {
            print("\(key) : \(value)")
        }
    }
}
