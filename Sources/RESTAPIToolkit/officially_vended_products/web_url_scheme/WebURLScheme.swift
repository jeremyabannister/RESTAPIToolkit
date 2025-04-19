//
//  WebURLScheme.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public enum WebURLScheme: ValueType {
    case http
    case https
    case ws
    case wss
    case other(String)
    
    ///
    public var identifier: String {
        switch self {
        case .http: return "http"
        case .https: return "https"
        case .ws: return "ws"
        case .wss: return "wss"
        case .other(let scheme): return scheme
        }
    }
}

///
extension WebURLScheme: CustomStringConvertible {
    
    ///
    public var description: String {
        "\(self.identifier)://"
    }
}
