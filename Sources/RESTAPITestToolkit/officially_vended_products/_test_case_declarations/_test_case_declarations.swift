//
//  _test_case_declarations.swift
//  
//
//  Created by Jeremy Bannister on 7/6/21.
//

///
public final class RESTEndpoint_tests: SingleTypeTestCase {
    public typealias Subject = RESTEndpoint
    public var metatype: Subject.Type { Subject.self }
}

///
public final class RESTRequest_tests: SingleTypeTestCase {
    public typealias Subject = RESTRequest
}
