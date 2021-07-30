//
//  RESTEndpoint.swift
//
//
//  Created by Jeremy Bannister on 9/27/20.
//

///
public struct RESTEndpoint: Hashable,
                            CustomStringConvertible,
                            Ergonomic {
    
    ///
    public var relativePath: PathOfStrings
    
    ///
    public init (_ relativePath: PathOfStrings) {
        self.relativePath = relativePath
    }
}

public extension RESTEndpoint {
    
    ///
    func absoluteURL (usingBase baseURL: URL) -> URL {
        baseURL.appendingStringPath(relativePath)
    }
    
    ///
    func appendingPathComponent (_ pathComponent: String) -> RESTEndpoint {
        self.mutating(\.relativePath) { $0.append(pathComponent) }
    }
}

///
public extension RESTEndpoint {
    
    ///
    var description: String {
        relativePath.pathString
    }
}
