//
//  File.swift
//  
//
//  Created by Jeremy Bannister on 7/6/21.
//

///
public extension XCTestCase {
    
    ///
    func proof_RESTEndpointRequestEncodable <T: RESTEndpointRequestEncodable> (_ t: T.Type) { }
    
    ///
    func proof_RESTEndpointRequestEncodable <T: RESTEndpointRequestEncodable> (_ t: T) { }
}
