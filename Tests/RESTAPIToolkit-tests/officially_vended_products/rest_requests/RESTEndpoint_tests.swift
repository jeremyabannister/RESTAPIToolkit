//
//  RESTEndpoint_tests.swift
//
//
//  Created by Jeremy Bannister on 5/6/21.
//

///
extension RESTEndpoint_tests {
    
    ///
    func test_existence () {
        let _: RESTEndpoint
    }
    
    ///
    func test_conformances () {
        Subject.proofOfConformanceTo_CustomStringConvertible()
        Subject.proofOfConformanceTo_Equatable()
        proof_ExpressionErgonomic(metatype)
    }
    
    ///
    func test_properties () {
        proof_mutableProperty(\Subject.relativePath, PathOfStrings.self)
    }
    
    ///
    func test_init () throws {
        try Subject([])
            .assert(\.relativePath, equals: [])
        try Subject(.dummyPath_foo)
            .assert(\.relativePath, equals: PathOfStrings.dummyPath_foo)
        try Subject(.dummyPath_foo_bar)
            .assert(\.relativePath, equals: PathOfStrings.dummyPath_foo_bar)
        try Subject(.dummyPath_foo_bar_baz)
            .assert(\.relativePath, equals: PathOfStrings.dummyPath_foo_bar_baz)
    }
}

///
extension RESTEndpoint_tests {
    
    ///
    func test_absoluteURL () throws {
        try Subject(.root)
            .absoluteURL(usingBase: .testURL)
            .assertEqual(to: URL(string: "https://apple.com")!)
        try Subject.dummy_foo
            .absoluteURL(usingBase: .testURL)
            .assertEqual(to: URL(string: "https://apple.com/foo")!)
        try Subject.dummy_foo_bar
            .absoluteURL(usingBase: .testURL)
            .assertEqual(to: URL(string: "https://apple.com/foo/bar")!)
        try Subject.dummy_foo_bar_baz
            .absoluteURL(usingBase: .testURL)
            .assertEqual(to: URL(string: "https://apple.com/foo/bar/baz")!)
    }
    
    ///
    func test_appendingPathComponent () throws {
        try Subject(.root)
            .appendingPathComponent("test")
            .assert(\.relativePath, equals: ["test"])
        try Subject.dummy_foo
            .appendingPathComponent("test")
            .assert(\.relativePath, equals: ["foo", "test"])
        try Subject.dummy_foo_bar
            .appendingPathComponent("test")
            .assert(\.relativePath, equals: ["foo", "bar", "test"])
    }
}

///
extension RESTEndpoint_tests {
    
    ///
    func test_description () throws {
        try Subject(.root).description
            .assertEqual(to: "/")
        try Subject.dummy_foo.description
            .assertEqual(to: "/foo")
        try Subject.dummy_foo_bar.description
            .assertEqual(to: "/foo/bar")
        try Subject.dummy_foo_bar_baz.description
            .assertEqual(to: "/foo/bar/baz")
    }
}
