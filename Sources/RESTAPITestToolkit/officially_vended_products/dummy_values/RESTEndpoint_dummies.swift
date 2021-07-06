//
//  RESTEndpoint_dummies.swift
//
//
//  Created by Jeremy Bannister on 5/7/21.
//

///
public extension RESTEndpoint {
    
    ///
    static var dummy_foo: Self {
        .init(.dummyPath_foo)
    }
    
    ///
    static var dummy_foo_bar: Self {
        .init(.dummyPath_foo_bar)
    }
    
    ///
    static var dummy_foo_bar_baz: Self {
        .init(.dummyPath_foo_bar_baz)
    }
}
