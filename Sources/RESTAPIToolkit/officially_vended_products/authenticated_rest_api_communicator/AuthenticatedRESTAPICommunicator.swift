//
//  AuthenticatedRESTAPICommunicator.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
public protocol Interface_AuthenticatedRESTAPICommunicator {
    
    ///
    func response
        (to unauthenticatedRequest: RESTEndpointRequest)
    async throws -> Data
}

///
public struct AuthenticatedRESTAPICommunicator
    <RESTAPI: Interface_RESTAPI,
     RequestAuthenticator: Interface_RESTEndpointRequestAuthenticator>:
        Interface_AuthenticatedRESTAPICommunicator {
    
    ///
    public init
        (restAPI: RESTAPI,
         requestAuthenticator: RequestAuthenticator) {
        
        ///
        self.restAPI = restAPI
        self.requestAuthenticator = requestAuthenticator
    }
    
    ///
    let restAPI: RESTAPI
    let requestAuthenticator: RequestAuthenticator
    
    ///
    public func response
        (to unauthenticatedRequest: RESTEndpointRequest)
    async throws -> Data {
        
        ///
        try await restAPI
            .response(
                to:
                    requestAuthenticator
                        .authenticateRequest(unauthenticatedRequest)
            )
    }
}
