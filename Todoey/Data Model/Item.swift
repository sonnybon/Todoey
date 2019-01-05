//
//  Item.swift
//  Todoey
//
//  Created by Sonny Bonyadi on 2019-01-05.
//  Copyright © 2019 Sonny Bonyadi. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
   @objc dynamic var title : String = ""
   @objc dynamic var done : Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
