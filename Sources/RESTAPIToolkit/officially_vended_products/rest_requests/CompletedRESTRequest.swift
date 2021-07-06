//
//  CompletedRESTRequest.swift
//
//
//  Created by Jeremy Bannister on 3/7/21.
//

///
public struct CompletedRESTRequest
<Request: Codable & Equatable & RESTRequestEncodable>:
    Codable,
    Equatable {
    
    ///
    public var request: Request
    
    ///
    public var rawResponse: RawRESTResponse
    
    ///
    public var dateInitiated: DiscreteDate
    
    ///
    public var dateCompleted: DiscreteDate
    
    ///
    public init (request: Request,
                 rawResponse: RawRESTResponse,
                 dateInitiated: DiscreteDate,
                 dateCompleted: DiscreteDate) {
        
        self.request = request
        self.rawResponse = rawResponse
        self.dateInitiated = dateInitiated
        self.dateCompleted = dateCompleted
    }
}

///
public extension CompletedRESTRequest {
    
    ///
    func response () throws -> Request.Response {
        try request.parseResponse(from: rawResponse)
    }
}


// MARK: - Codable Conformance

///
public extension CompletedRESTRequest {
    
    ///
    enum CodingKeys: CodingKey {
        case request
        case rawResponse
        case dateInitiated
        case dateCompleted
    }
    
    ///
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(request, forKey: .request)
        try container.encode(rawResponse, forKey: .rawResponse)
        try container.encode(dateInitiated, forKey: .dateInitiated)
        try container.encode(dateCompleted, forKey: .dateCompleted)
    }
    
    ///
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            request: try container.decode(Request.self, forKey: .request),
            rawResponse: try container.decode(RawRESTResponse.self, forKey: .rawResponse),
            dateInitiated: try container.decode(DiscreteDate.self, forKey: .dateInitiated),
            dateCompleted: try container.decode(DiscreteDate.self, forKey: .dateCompleted)
        )
    }
}
