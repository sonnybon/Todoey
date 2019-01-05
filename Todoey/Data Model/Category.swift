//
//  Category.swift
//  Todoey
//
//  Created by Sonny Bonyadi on 2019-01-05.
//  Copyright © 2019 Sonny Bonyadi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
