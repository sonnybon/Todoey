//
//  Item.swift
//  Todoey
//
//  Created by Sonny Bonyadi on 2018-12-23.
//  Copyright © 2018 Sonny Bonyadi. All rights reserved.
//

import Foundation


class Item : Encodable, Decodable{
    var title : String = ""
    var done : Bool = false
}
