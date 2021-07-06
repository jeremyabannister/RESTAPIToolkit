//
//  File.swift
//  
//
//  Created by Jeremy Bannister on 7/6/21.
//

///
public extension XCTestCase {
    
    ///
    func proof_RESTRequestEncodable <T: RESTRequestEncodable> (_ t: T.Type) { }
    
    ///
    func proof_RESTRequestEncodable <T: RESTRequestEncodable> (_ t: T) { }
}
