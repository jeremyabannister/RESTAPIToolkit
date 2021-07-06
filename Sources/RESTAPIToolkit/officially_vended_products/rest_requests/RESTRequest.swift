//
//  RESTRequest.swift
//
//
//  Created by Jeremy Bannister on 9/27/20.
//

/// An `RESTRequest` is everything that a `URLRequest` is minus the base URL, meaning that a single `RESTRequest` value is usable across many base URLs. Use `RESTRequest.urlRequest(usingBaseURL:)` to generate the `URLRequest` to send this `RESTRequest` to the given base URL.
public struct RESTRequest: Equatable {
    
    public var endpoint: RESTEndpoint
    public var method: String
    public var headers: JSONHeaders?
    public var queryItems: URLQueryItems?
    public var bodyParameters: JSONDictionary?
    
    public init (endpoint: RESTEndpoint,
                 method: String,
                 headers: JSONHeaders?,
                 queryItems: URLQueryItems?,
                 bodyParameters: JSONDictionary?) {
        
        self.endpoint = endpoint
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.bodyParameters = bodyParameters
    }
}

// MARK: - Convenience Methods
public extension RESTRequest {
    
    /// This is the primary method of the `RESTRequest` type - ultimately a `URLRequest` is what will be needed in order to execute a network request, and this method is how that `URLRequest` should be generated. Pass in the base URL to which you want to send this `RESTRequest` in order to receive back the properly configured `URLRequest`.
    func urlRequest (usingBaseURL baseURL: URL) -> URLRequest {
        .basic(
            url: self.endpoint.absoluteURL(usingBase: baseURL),
            method: self.method,
            headers: self.headers,
            queryItems: self.queryItems,
            bodyParameters: self.bodyParameters
        )
    }
}
