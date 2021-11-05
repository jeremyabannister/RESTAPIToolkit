//
//  SuccessfulRESTRequest.swift
//  
//
//  Created by Jeremy Bannister on 11/4/21.
//

///
public typealias SuccessfulRESTRequest <Request: RESTRequestEncodable> =
    _CompletedRESTRequest<Request, Request.SuccessfulResponse>
