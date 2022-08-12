//
//  URLQueryItems.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public typealias URLQueryItems = [URLQueryItem]

///
public extension URLQueryItems {
    
    ///
    func adding <Parameter: URLSafeEncodable> (_ key: String,
                                               _ value: Parameter)
        -> URLQueryItems {
        
        self.appending(URLQueryItem(name: key, value: value.asURLSafe))
    }
    
    ///
    func adding <Parameter: URLSafeEncodable> (_ key: String,
                                               _ value: Parameter?)
        -> URLQueryItems {
        
        guard let value = value else { return self }
        return self.adding(key, value)
    }
}

///
public extension URLQueryItems {
    
    ///
    mutating func add <Parameter: URLSafeEncodable> (_ key: String,
                                                     _ value: Parameter) {
        
        self = self.adding(key, value)
    }
    
    ///
    mutating func add <Parameter: URLSafeEncodable> (_ key: String,
                                                     _ value: Parameter?) {
        
        guard let value = value else { return }
        self = self.adding(key, value)
    }
}



// MARK: - URLSafe -

public typealias URLSafe = String



// MARK: - URLSafeEncodable -

///
public protocol URLSafeEncodable {
    var asURLSafe: URLSafe { get }
}

/// This default conformance is provided to types which already inherit from `CustomStringConvertible`.
public extension URLSafeEncodable where Self: CustomStringConvertible {
    
    ///
    var asURLSafe: URLSafe {
        self.description
    }
}

// MARK: - Conformance for basic types

extension Bool: URLSafeEncodable { }
extension Int: URLSafeEncodable { }
extension Double: URLSafeEncodable { }
extension String: URLSafeEncodable { }
extension UUID: URLSafeEncodable { }
