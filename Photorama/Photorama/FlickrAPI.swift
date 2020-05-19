//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/18.
//  Copyright © 2020 SXC. All rights reserved.
//

import Foundation

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"

    static func photos(fromJSON data: Data) -> Result<[Photo], Error> {
        do {
            let decoder = JSONDecoder()
            let flickrResponse = try decoder.decode(FlickrResponse.self, from: data)
            return .success(flickrResponse.photosInfo.photos)
        } catch {
            return .failure(error)
        }
    }
    
    struct FlickrResponse: Codable {
//        let photos: FlickrPhotoResponse
        let photosInfo: FlickrPhotosResponse
        
        enum CodingKeys: String, CodingKey {
            case photosInfo = "photos"
        }
    }
    
    struct FlickrPhotosResponse: Codable {
//        let photo: [Photo]
        let photos: [Photo]
        
        enum CodingKeys: String, CodingKey {
            case photos = "photo"
        }
    }
    
    private static func flickrURL(endPoint: EndPoint, parameters: [String:String]?) -> URL {

        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": endPoint.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
        
    }
    
    static var interestingPhotosURL: URL {
        return flickrURL(endPoint: .interestingPhotos, parameters: ["extras": "url_z,datte_taken"])
    }
}


