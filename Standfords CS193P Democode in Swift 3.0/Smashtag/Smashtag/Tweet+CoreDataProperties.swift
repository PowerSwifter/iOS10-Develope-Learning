//
//  Tweet+CoreDataProperties.swift
//  Smashtag
//
//  Created by Boshi Li on 2016/11/11.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Tweet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tweet> {
        return NSFetchRequest<Tweet>(entityName: "Tweet");
    }

    @NSManaged public var text: String?
    @NSManaged public var unipue: String?
    @NSManaged public var posted: NSDate?
    @NSManaged public var twitter: TwitterUser?

}
