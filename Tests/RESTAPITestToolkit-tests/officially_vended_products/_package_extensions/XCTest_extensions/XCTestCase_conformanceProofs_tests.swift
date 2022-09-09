//
//  XCTestCase_conformanceProofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 7/6/21.
//

///
extension XCTestCase_tests {
    
    ///
    func test_proof_RESTEndpointRequestEncodable_Metatype () {
        func imagine <T: RESTEndpointRequestEncodable> (t: T) {
            ifGiven(metatype) {
                $0.proof_RESTEndpointRequestEncodable(T.self)
            }
        }
    }
    
    ///
    func test_proof_RESTEndpointRequestEncodable_instance () {
        func imagine <T: RESTEndpointRequestEncodable> (t: T) {
            ifGiven(metatype) {
                $0.proof_RESTEndpointRequestEncodable(t)
            }
        }
    }
}
