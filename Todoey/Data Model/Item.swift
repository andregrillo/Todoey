//
//  Item.swift
//  Todoey
//
//  Created by André Grillo on 23/12/17.
//  Copyright © 2017 André Grillo. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
