//
//  Photo+CoreDataProperties.swift
//  Concurrency
//
//  Created by Grace Njoroge on 07/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var imageUrl: String?

}
