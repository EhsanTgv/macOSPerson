//
//  Person.swift
//  macOSPerson
//
//  Created by Ehsan Taghavi on 9/6/23.
//

import Foundation

struct Person {
    var name : String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func getSampleData() -> [Person]{
        let p1 = Person(name: "Tom", age: 10),
            p2 = Person(name: "Jerry", age: 8),
            p3 = Person(name: "Swift", age: 10),
            p4 = Person(name: "Kat", age: 12)
        
        return [p1,p2,p3,p4]
    }
}
