//
//  DBHelper.swift
//  RealmTest
//
//  Created by Taylor Howard on 5/7/17.
//  Copyright © 2017 Taylor Howard. All rights reserved.
//

import Foundation
import RealmSwift

enum Environment {
    case app
    case test
}

class DBHelper {
    var realm: Realm
    static let prodInstance = DBHelper(inEnvironment: .app)
    static let testInstance = DBHelper(inEnvironment: .test)
    
    init(inEnvironment env: Environment) {
        if env == .test {
            realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "TestRealm"))
        }
        else {
            realm = try! Realm()
        }
    }
    
    func writeObject(_ objects: [Object]) {
        try! realm.write {
            for o in objects {
                realm.add(o)
            }
        }
    }
    
    func getObject(ofType type: Object.Type) -> Results<Object> {
        return realm.objects(type)
    }
    
    func deleteObject(_ object: Object) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func deleteAll(ofType type: Object.Type) {
        let objects = realm.objects(type)
        try! realm.write {
            realm.delete(objects)
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
