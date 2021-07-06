//
//  RESTEndpoint_dummies_tests.swift
//
//
//  Created by Jeremy Bannister on 5/7/21.
//

///
extension RESTEndpoint_tests {
    
    ///
    func test_dummy_foo () throws {
        try RESTEndpoint.dummy_foo
            .assertEqual(to: .init(.dummyPath_foo))
    }
    
    ///
    func test_dummy_foo_bar () throws {
        try RESTEndpoint.dummy_foo_bar
            .assertEqual(to: .init(.dummyPath_foo_bar))
    }
    
    ///
    func test_dummy_foo_bar_baz () throws {
        try RESTEndpoint.dummy_foo_bar_baz
            .assertEqual(to: .init(.dummyPath_foo_bar_baz))
    }
}
