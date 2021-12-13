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
        proof_mutableProperty(\.headers, JSONHeaders?.self)
        proof_mutableProperty(\.queryItems, URLQueryItems?.self)
        proof_mutableProperty(\.bodyParameters, JSONDictionary?.self)
    }
    
    ///
    func test_init_endpoint_method_headers_queryItems_bodyParameters () throws {
        try Subject(
            endpoint: .dummy_foo_bar,
            method: .testing123,
            headers: .dummyJSONHeaders_ab_cd,
            queryItems: .dummy_fooBar,
            bodyParameters: .dummyJSONDict
        )
            .assert(\.endpoint, equals: .dummy_foo_bar)
            .assert(\.method, equals: .testing123)
            .assert(\.headers, equals: .dummyJSONHeaders_ab_cd)
            .assert(\.queryItems, equals: .dummy_fooBar)
            .assert(\.bodyParameters, equals: .dummyJSONDict)
    }
}

///
extension RESTRequest_tests {
    
    ///
    func test_urlRequest_usingBaseURL () throws {
        // TODO: Write this!!
    }
}
