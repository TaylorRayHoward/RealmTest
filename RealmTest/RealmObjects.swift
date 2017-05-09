//
//  File.swift
//  RealmTest
//
//  Created by Taylor Howard on 5/7/17.
//  Copyright © 2017 Taylor Howard. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var fname = ""
    dynamic var lname = ""
    dynamic var id = ""
    override class func primaryKey() -> String {
        return "id"
    }
    
    convenience init(fname: String, lname: String) {
        self.init()
        self.fname = fname
        self.lname = lname
        self.id = UUID().uuidString
    }
}

class Business: Object {
    dynamic var name = ""
    dynamic var state = ""
    dynamic var id = ""
    override class func primaryKey() -> String {
        return "id"
    }
    
    convenience init(name: String, state: String) {
        self.init()
        self.name = name
        self.state = state
        self.id = UUID().uuidString
    }
}
