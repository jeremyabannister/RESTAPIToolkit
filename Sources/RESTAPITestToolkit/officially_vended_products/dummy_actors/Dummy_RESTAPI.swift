//
//  Dummy_RESTAPI.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
public extension Dummy {
    
    ///
    actor RESTAPI: Interface_RESTAPI {
        
        ///
        public var responseToRequest: (RESTEndpointRequest)async throws->Data
        
        ///
        public init (responseToRequest: @escaping (RESTEndpointRequest)async throws->Data) {
            self.responseToRequest = responseToRequest
        }
        
        ///
        public func response
            (to request: RESTEndpointRequest)
        async throws -> Data {
            
            ///
            try await responseToRequest(request)
        }
    }
}
