//
//  RESTEndpointRequestEncodable.swift
//
//
//  Created by Jeremy Bannister on 12/7/20.
//

///
public protocol RESTEndpointRequestEncodable: ProperValueType {
    
    ///
    associatedtype Configuration: Hashable & Codable
    
    ///
    associatedtype SuccessfulResponse: Hashable & Codable
    
    ///
    associatedtype StandardError: Hashable & Codable
    
    ///
    func asRESTEndpointRequest (configuration: Configuration) -> RESTEndpointRequest
    
    ///
    func parseSuccessfulResponse (from data: Data) -> SuccessfulResponse?
    
    ///
    func parseStandardError (from data: Data) -> StandardError?
}

///
public extension RESTEndpointRequestEncodable {
    
    ///
    typealias RESTResult = Result<SuccessfulResponse, RESTError<Self>>
}
