//
//  _CompletedRESTRequest.swift
//  
//
//  Created by Jeremy Bannister on 11/4/21.
//

///
public struct _CompletedRESTRequest
    <Request: RESTRequestEncodable,
     Response: Hashable>:
        ProperValueType {
    
    ///
    public var request: Request
    
    ///
    public var response: Response
    
    ///
    public var dateInitiated: Date
    
    ///
    public var dateCompleted: Date
    
    ///
    public init (request: Request,
                 response: Response,
                 dateInitiated: Date,
                 dateCompleted: Date) {
        
        self.request = request
        self.response = response
        self.dateInitiated = dateInitiated
        self.dateCompleted = dateCompleted
    }
}

// MARK: - Error Conformance

extension _CompletedRESTRequest: Error where Response: Error { }

// MARK: - Codable Conformance

///
extension _CompletedRESTRequest: Codable
    where Request: Codable,
          Response: Codable {
    
    ///
    public func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(request, forKey: .request)
        try container.encode(response, forKey: .response)
        try container.encode(dateInitiated, forKey: .dateInitiated)
        try container.encode(dateCompleted, forKey: .dateCompleted)
    }
    
    ///
    public init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            request: try container.decode(Request.self, forKey: .request),
            response: try container.decode(Response.self, forKey: .response),
            dateInitiated: try container.decode(Date.self, forKey: .dateInitiated),
            dateCompleted: try container.decode(Date.self, forKey: .dateCompleted)
        )
    }
    
    ///
    private enum CodingKeys: CodingKey {
        case request
        case response
        case dateInitiated
        case dateCompleted
    }
}
