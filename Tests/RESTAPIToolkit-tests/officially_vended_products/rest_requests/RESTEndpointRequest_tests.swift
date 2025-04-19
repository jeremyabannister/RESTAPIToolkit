//
//  RESTEndpointRequest_tests.swift
//
//
//  Created by Jeremy Bannister on 5/6/21.
//

///
extension RESTEndpointRequest_tests {
    
    ///
    func test_existence () {
        let _: RESTEndpointRequest
    }
    
    ///
    func test_conformances () {
        Subject.proofOfConformanceTo_ValueType()
    }
    
    ///
    func test_properties () {
        Subject.proofOfMutableProperty(\.endpoint, RESTEndpoint.self)
        Subject.proofOfMutableProperty(\.method, String.self)
        Subject.proofOfMutableProperty(\.headers, RESTHeaders?.self)
        Subject.proofOfMutableProperty(\.queryItems, URLQueryItems?.self)
        Subject.proofOfMutableProperty(\.bodyData, Data?.self)
    }
    
    ///
    func test_init_endpoint_method_headers_queryItems_bodyParameters () throws {
        try Subject(
            endpoint: .dummy_foo_bar,
            method: .testing123,
            headers: .dummyRESTHeaders_ab_cd,
            queryItems: .dummy_fooBar,
            bodyData: .dummyBodyData
        )
            .assert(\.endpoint, equals: .dummy_foo_bar)
            .assert(\.method, equals: .testing123)
            .assert(\.headers, equals: .dummyRESTHeaders_ab_cd)
            .assert(\.queryItems, equals: .dummy_fooBar)
            .assert(\.bodyData, equals: .dummyBodyData)
    }
}

///
extension RESTEndpointRequest_tests {
    
    ///
    func test_urlRequest_usingBaseURL () throws {
        // TODO: Write this!!
    }
}
