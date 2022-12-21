//
//  Login+CoreDataProperties.swift
//  lin_Final
//
//  Created by User01 on 2022/12/21.
//
//

import Foundation
import CoreData


extension Login {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login")
    }

    @NSManaged public var token: String?
    @NSManaged public var login: String?

}

extension Login : Identifiable {

}
