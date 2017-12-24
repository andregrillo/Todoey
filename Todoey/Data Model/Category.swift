//
//  Category.swift
//  Todoey
//
//  Created by André Grillo on 23/12/17.
//  Copyright © 2017 André Grillo. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
