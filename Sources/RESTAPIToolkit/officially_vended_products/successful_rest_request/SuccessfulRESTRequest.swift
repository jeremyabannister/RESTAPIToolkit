//
//  SuccessfulRESTRequest.swift
//  
//
//  Created by Jeremy Bannister on 11/4/21.
//

///
public typealias SuccessfulRESTRequest <Request: RESTEndpointRequestEncodable> =
    _CompletedRESTRequest<Request, Request.SuccessfulResponse>
