//
//  Interface_RESTEndpointRequestAuthenticator.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
public protocol Interface_RESTEndpointRequestAuthenticator {
    
    ///
    func authenticateRequest
        (_ request: RESTEndpointRequest)
    async throws -> RESTEndpointRequest
}
