//
//  Item.swift
//  NoteBook
//
//  Created by SandhyAvinash on 4/22/19.
//  Copyright © 2019 fnu sandhiya. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
