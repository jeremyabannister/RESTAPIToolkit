//
//  RESTEndpoint.swift
//
//
//  Created by Jeremy Bannister on 9/27/20.
//

///
public struct RESTEndpoint: ValueType,
                            CustomStringConvertible {
    
    ///
    public var relativePath: [String]
    
    ///
    public init(_ relativePath: [String]) {
        self.relativePath = relativePath
    }
}

extension RESTEndpoint {
    
    ///
    public func absoluteURL(usingBase baseURL: URL) -> URL {
        baseURL.appendingStringPath(relativePath)
    }
    
    ///
    public func appendingPathComponent(_ pathComponent: String) -> RESTEndpoint {
        self.mutating(\.relativePath) { $0.append(pathComponent) }
    }
}

///
extension RESTEndpoint {
    
    ///
    public var description: String {
        "/\(relativePath.joined(separator: "/"))"
    }
}

///
fileprivate extension URL {
    
    ///
    func appendingStringPath(_ stringPath: [String]) -> Self {
        stringPath.reduce(into: self) { $0.appendPathComponent($1) }
    }
}
