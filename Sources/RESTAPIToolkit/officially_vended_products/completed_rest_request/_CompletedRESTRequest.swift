//
//  _CompletedRESTRequest.swift
//  
//
//  Created by Jeremy Bannister on 11/4/21.
//

///
public struct _CompletedRESTRequest
    <Request: RESTEndpointRequestEncodable,
     Response: Hashable & Codable>:
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
