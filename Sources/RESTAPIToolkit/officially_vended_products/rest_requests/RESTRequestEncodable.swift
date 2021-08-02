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
    associatedtype SuccessfulResponse: Hashable
    
    ///
    associatedtype StandardError: Hashable
    
    ///
    func parseSuccessfulResponse (from data: Data) -> SuccessfulResponse?
    
    ///
    func parseStandardError (from data: Data) -> StandardError?
}

///
public extension RESTRequestEncodable {
    
    ///
    typealias RESTResult = Result<SuccessfulResponse, RESTError<Self>>
}
