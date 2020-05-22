//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Xiaochun Shen on 2020/5/22.
//  Copyright © 2020 SXC. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var photoID: String?
    @NSManaged public var title: String?
    @NSManaged public var dateTaken: Date?
    @NSManaged public var remoteURL: URL?

}
