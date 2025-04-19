//
//  RESTEndpointRequestEncodable.swift
//
//
//  Created by Jeremy Bannister on 12/7/20.
//

///
public protocol RESTEndpointRequestEncodable: ValueType {
    
    ///
    associatedtype Configuration: Hashable & Sendable
    
    ///
    associatedtype SuccessfulResponse: Hashable & Sendable
    
    ///
    associatedtype StandardError: Hashable & Sendable
    
    ///
    func asRESTEndpointRequest(configuration: Configuration) -> RESTEndpointRequest
    
    ///
    func parseSuccessfulResponse(from data: Data) -> SuccessfulResponse?
    
    ///
    func parseStandardError(from data: Data) -> StandardError?
}

///
extension RESTEndpointRequestEncodable {
    
    ///
    public typealias RESTResult = Result<SuccessfulResponse, RESTError<Self>>
}
