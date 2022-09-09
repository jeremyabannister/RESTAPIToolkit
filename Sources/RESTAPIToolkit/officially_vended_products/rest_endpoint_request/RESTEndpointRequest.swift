//
//  RESTEndpointRequest.swift
//
//
//  Created by Jeremy Bannister on 9/27/20.
//

/// A `RESTEndpointRequest` represents the details of a request to a given REST endpoint, but it does not contain any base URL, meaning that to upgrade a `RESTEndpointRequest` to a `URLRequest` (in order to be able to actually execute it) you'll need to provide just a base URL via the method `.urlRequest(usingBaseURL:)`.
public struct RESTEndpointRequest: ProperValueType {
    
    ///
    public var endpoint: RESTEndpoint
    public var method: String
    public var headers: RESTHeaders?
    public var queryItems: URLQueryItems?
    public var bodyData: Data?
    
    ///
    public init
        (endpoint: RESTEndpoint,
         method: String,
         headers: RESTHeaders?,
         queryItems: URLQueryItems?,
         bodyData: Data?) {
        
        self.endpoint = endpoint
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.bodyData = bodyData
    }
}

///
public extension RESTEndpointRequest {
    
    ///
    init
        <Body: Codable>
        (endpoint: RESTEndpoint,
         method: String,
         headers: RESTHeaders?,
         queryItems: URLQueryItems?,
         body: Body)
    throws {
        
        ///
        try self.init(
            endpoint: endpoint,
            method: method,
            headers: headers,
            queryItems: queryItems,
            bodyData: JSONEncoder().encode(body)
        )
    }
}

// MARK: - Convenience Methods
public extension RESTEndpointRequest {
    
    /// This is the primary method of the `RESTRequest` type - ultimately a `URLRequest` is what will be needed in order to execute a network request, and this method is how that `URLRequest` should be generated. Pass in the base URL to which you want to send this `RESTRequest` in order to receive back the properly configured `URLRequest`.
    func urlRequest (usingBaseURL baseURL: URL) -> URLRequest {
        .basic(
            url: self.endpoint.absoluteURL(usingBase: baseURL),
            method: self.method,
            headers: self.headers,
            queryItems: self.queryItems,
            bodyData: self.bodyData
        )
    }
}
