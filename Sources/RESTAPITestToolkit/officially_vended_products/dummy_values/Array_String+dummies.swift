//
//  Array_String+dummies.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension Array where Element == String {
    
    ///
    static var root: Self {
        []
    }
    
    ///
    static var dummyPath_foo: Self {
        ["foo"]
    }
    
    ///
    static var dummyPath_foo_bar: Self {
        ["foo", "bar"]
    }
    
    ///
    static var dummyPath_foo_bar_baz: Self {
        ["foo", "bar", "baz"]
    }
}
