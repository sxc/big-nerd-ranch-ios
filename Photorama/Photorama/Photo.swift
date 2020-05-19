//
//  Photo.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/19.
//  Copyright © 2020 SXC. All rights reserved.
//

import Foundation

class Photo: Codable {
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    enum codingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
}