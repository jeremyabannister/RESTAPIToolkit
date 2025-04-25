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
        Subject.proofOfConformanceTo_Equatable()
    }
    
    ///
    func test_properties () {
        proofThatSubjectHasSettableProperty(\.endpoint, ofType: RESTEndpoint.self)
        proofThatSubjectHasSettableProperty(\.method, ofType: String.self)
        proofThatSubjectHasSettableProperty(\.headers, ofType: RESTHeaders?.self)
        proofThatSubjectHasSettableProperty(\.queryItems, ofType: URLQueryItems?.self)
        proofThatSubjectHasSettableProperty(\.bodyData, ofType: Data?.self)
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
