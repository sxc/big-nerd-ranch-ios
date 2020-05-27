//
//  FlickrAPI.swift
//  FlickrDemo
//
//  Created by Xiaochun Shen on 2020/5/26.
//  Copyright © 2020 SXC. All rights reserved.
//

import Foundation


enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrResponse: Codable {
    let photosInfo: FlickrPhotosResponse
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
    
    
}

struct FlickrPhotosResponse: Codable {
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}


struct FlickrAPI {
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL(endPoint: EndPoint, parameters: [String: String]?) -> URL {
        
//        return URL(string: "")!
        
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
        
//        if let componetsURL = components.url {
//            print("URL = \(componetsURL)")
//        }
        return components.url!
        
    }
    
    static var interestingPhotosURL: URL {
        return flickrURL(endPoint: .interestingPhotos, parameters: ["extras": "url_z, date_taken"])
    }
    
    
    static func photos(fromJSON data: Data) -> Result<[Photo], Error> {
        do {
            let decoder = JSONDecoder()
            let flickrResponse = try
                decoder.decode(FlickrResponse.self, from: data)
            return .success(flickrResponse.photosInfo.photos)
        } catch {
            return .failure(error)
        }
    }
    
}

