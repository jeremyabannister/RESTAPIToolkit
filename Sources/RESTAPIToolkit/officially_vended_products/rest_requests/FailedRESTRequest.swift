//
//  FailedRESTRequest.swift
//  
//
//  Created by Jeremy Bannister on 11/4/21.
//

///
public typealias FailedRESTRequest <Request: RESTRequestEncodable> =
    _CompletedRESTRequest<Request, RESTError<Request>>
