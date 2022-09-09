//
//  RESTError.swift
//  
//
//  Created by Jeremy Bannister on 8/1/21.
//

///
public enum RESTError <Request: RESTEndpointRequestEncodable>: ProperValueType,
                                                       Error {
    
    ///
    case networkError (NetworkError)
    
    ///
    case understood (standardError: Request.StandardError)
    
    ///
    case uninterpretable (rawData: Data)
}
