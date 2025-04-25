//
//  XCTestCase_conformanceProofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 7/6/21.
//

///
extension XCTestCase_tests {
    
    ///
    func test_proof_RESTRequestEncodable_Metatype () {
        func imagine <T: RESTRequestEncodable> (t: T) {
            ifGiven(XCTestCase.self) {
                $0.proof_RESTRequestEncodable(T.self)
            }
        }
    }
    
    ///
    func test_proof_RESTRequestEncodable_instance () {
        func imagine <T: RESTRequestEncodable> (t: T) {
            ifGiven(XCTestCase.self) {
                $0.proof_RESTRequestEncodable(t)
            }
        }
    }
}
