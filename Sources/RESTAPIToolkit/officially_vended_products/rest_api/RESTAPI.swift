//
//  RESTAPI.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
public protocol Interface_RESTAPI {
    
    ///
    func response
        (to request: RESTEndpointRequest)
    async throws -> Data
}

///
public struct RESTAPI: Interface_RESTAPI {
    
    ///
    public var baseURL: URL
    
    ///
    public init (baseURL: URL) {
        self.baseURL = baseURL
    }
    
    ///
    public func response
        (to request: RESTEndpointRequest)
    async throws -> Data {
        
        ///
        try await request
            .urlRequest(usingBaseURL: baseURL)
            .fetchData()
    }
}
