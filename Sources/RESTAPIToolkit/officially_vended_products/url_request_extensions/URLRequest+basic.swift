//
//  URLRequest+basic.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

// MARK: - URLRequest_basic -

public extension URLRequest {
    
    // TODO: Why is `method` stringly typed instead of being an enum containing REST method options?
    
    ///
    static func basic
        (url: URL,
         method: String,
         headers: RESTHeaders?,
         queryItems: URLQueryItems?,
         bodyData: Data?)
    -> URLRequest {
            
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.setQueryItems(to: queryItems)
        request.httpBody = bodyData
        return request
    }
}

