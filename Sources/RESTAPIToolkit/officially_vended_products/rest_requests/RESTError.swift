//
//  RESTError.swift
//  
//
//  Created by Jeremy Bannister on 8/1/21.
//

///
public enum RESTError <Request: RESTRequestEncodable>: ProperValueType,
                                                       Error {
    
    ///
    case networkError (NetworkError)
    
    ///
    case understood (standardError: Request.StandardError)
    
    ///
    case uninterpretable (rawData: Data)
}

///
// MARK: - PolygonError + Codable
extension RESTError: Codable where Request.StandardError: Codable {
    
    ///
    public func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .networkError (let networkError):
            try container.encode(networkError, forKey: .networkError)
        
        case .understood (let standardError):
            try container.encode(standardError, forKey: .understood)
            
        case .uninterpretable (let rawData):
            try container.encode(rawData, forKey: .uninterpretable)
        }
    }
    
    ///
    public init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let onlyKey = container.allKeys.only
        if onlyKey == .networkError {
            self = try .networkError(
                container.decode(NetworkError.self, forKey: .networkError)
            )
        } else if onlyKey == .understood {
            self = try .understood(
                standardError: container.decode(Request.StandardError.self, forKey: .understood)
            )
        } else if onlyKey == .uninterpretable {
            self = try .uninterpretable(
                rawData: container.decode(Data.self, forKey: .uninterpretable)
            )
        } else {
            throw Self.standardDecodingError
        }
    }
    
    ///
    private enum CodingKeys: CodingKey {
        case networkError
        case understood
        case uninterpretable
    }
}
