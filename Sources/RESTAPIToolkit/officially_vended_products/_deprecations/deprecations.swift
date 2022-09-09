//
//  deprecations.swift
//  
//
//  Created by Jeremy Bannister on 9/9/22.
//

///
@available(*, deprecated, message: "Renamed `RESTRequest` to `RESTEndpointRequest` which seemed like a clearly superior name because it emphasizes the central fact which the other does not, which is that the value represents a request against an endpoint, not against a fully resolved url (i.e., the base URL is still missing)")
public typealias RESTRequest = RESTEndpointRequest

///
@available(*, deprecated, message: "Renamed `RESTRequestEncodable` to `RESTEndpointRequestEncodable` because the centrally relevant type, `RESTRequest`, was renamed to `RESTEndpointRequest`. See that deprecation message for details.")
public typealias RESTRequestEncodable = RESTEndpointRequestEncodable
