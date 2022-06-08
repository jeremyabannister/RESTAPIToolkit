//
//  URL+webURL.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

public extension URL {
    
    ///
    static func webURL
        (scheme: WebURLScheme,
         host: String,
         path: [String]? = nil,
         queryItems: URLQueryItems? = nil)
    -> URL? {
        
        ///
        URLComponents()
            .setting(\.scheme, to: scheme.identifier)
            .setting(\.host, to: host)
            .trySetting(
                \.path,
                 to: path.map { "/\($0.joined(separator: "/"))" }
            )
            .setting(
                \.queryItems,
                to: queryItems
            )
            .url
    }
    
    ///
    static func webURL
        (scheme: WebURLScheme,
         subdomain: String?,
         domain: String,
         path: [String]?,
         queryItems: URLQueryItems?)
    -> URL? {
        
        ///
        webURL(
            scheme: scheme,
            host: "\(subdomain.map { "\($0)." } ?? "")\(domain)",
            path: path,
            queryItems: queryItems
        )
    }
}
