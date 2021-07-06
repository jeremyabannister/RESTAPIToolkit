//
//  RESTRequestEncodable.swift
//
//
//  Created by Jeremy Bannister on 12/7/20.
//

///
public protocol RESTRequestEncodable {
    
    ///
    var asRESTRequest: RESTRequest { get }
    
    ///
    associatedtype Response
    
    ///
    func parseResponse (from rawResponse: RawRESTResponse) throws -> Response
}

///
extension RESTRequest: RESTRequestEncodable {
    
    ///
    public typealias Response = RawRESTResponse
    
    ///
    public var asRESTRequest: RESTRequest {
        self
    }
    
    ///
    public func parseResponse (from rawResponse: RawRESTResponse) -> RawRESTResponse {
        return rawResponse
    }
}
