//
//  RealmTestTests.swift
//  RealmTestTests
//
//  Created by Taylor Howard on 5/7/17.
//  Copyright © 2017 Taylor Howard. All rights reserved.
//

import Quick
import Nimble
@testable import RealmTest

class PersonSpec: QuickSpec {
    override func spec() {
        describe("Test DBHelper class") {
            afterEach {
                DBHelper.testInstance.deleteAll()
            }
            it("Can read and write") {
                let person = Person(fname: "Foo", lname: "Bar")
                DBHelper.testInstance.writeObject([person])
                //I don't like testing two things at once, but it's kinda necessary here.
                let newPerson = DBHelper.testInstance.getObject(ofType: Person.self).first! as! Person
                expect(newPerson.fname).to(equal("Foo"))
            }
        }
    }
}
