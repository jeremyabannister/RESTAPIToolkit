//
//  JSONDictionary+dummies.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension JSONDictionary {
    
    ///
    static var dummyJSONDict: Self {
        [
            "prop1": .bool(true),
            "prop2": .string("hello"),
            "prop3": .number(3.14)
        ]
    }
}
