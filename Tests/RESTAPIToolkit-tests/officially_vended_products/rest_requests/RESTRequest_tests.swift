//
//  RESTRequest_tests.swift
//
//
//  Created by Jeremy Bannister on 5/6/21.
//

///
extension RESTRequest_tests {
    
    ///
    func test_existence () {
        let _: RESTRequest
    }
    
    ///
    func test_conformances () {
        proof_Equatable(metatype)
    }
    
    ///
    func test_properties () {
        proof_mutableProperty(\.endpoint, RESTEndpoint.self)
        proof_mutableProperty(\.method, String.self)
        proof_mutableProperty(\.headers, RESTHeaders?.self)
        proof_mutableProperty(\.queryItems, URLQueryItems?.self)
        proof_mutableProperty(\.bodyData, Data?.self)
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
extension RESTRequest_tests {
    
    ///
    func test_urlRequest_usingBaseURL () throws {
        // TODO: Write this!!
    }
}
