//
//  URLQueryItems+dummies.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension URLQueryItems {
    
    ///
    static var dummy_ab_cd: Self {
        [
            .init(name: "a", value: "b"),
            .init(name: "c", value: "d")
        ]
    }
    
    ///
    static var dummy_fooBar: Self {
        [
            .init(name: "foo", value: "bar"),
        ]
    }
    
    ///
    static var dummy_fooBar_bazBop: Self {
        [
            .init(name: "foo", value: "bar"),
            .init(name: "baz", value: "bop")
        ]
    }
}
