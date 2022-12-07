//
//  AuthenticatedRESTAPICommunicator_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
final class AuthenticatedRESTAPICommunicator_tests: SingleTypeTestCase {
    
    ///
    typealias Subject =
        AuthenticatedRESTAPICommunicator<
            Dummy.RESTAPI,
            Dummy.RequestAuthenticator
        >
    
    ///
    func test_response_to_RESTEndpointRequest () async throws {
        
        ///
        let request =
            RESTEndpointRequest(
                endpoint: .dummy_foo,
                method: "GET",
                headers: nil,
                queryItems: nil,
                bodyData: nil
            )
        
        ///
        let expectedHeaders = Dummy.RequestAuthenticator.dummyHeaders
        
        ///
        let restAPI = Dummy.RESTAPI { incomingRequest in
            try incomingRequest
                .assertEqual(
                    to: request.setting(\.headers, to: expectedHeaders)
                )
            return "success".utf8Data
        }
        
        ///
        let requestAuthenticator = Dummy.RequestAuthenticator()
        
        ///
        try await
            Subject(
                restAPI: restAPI,
                requestAuthenticator: requestAuthenticator
            )
            .response(to: request)
            .assertEqual(to: "success".utf8Data)
    }
}

///
public extension Dummy {
    
    ///
    actor RESTAPI: Interface_RESTAPI {
        
        ///
        public var responseToRequest: (RESTEndpointRequest)async throws->Data
        
        ///
        public init (responseToRequest: @escaping (RESTEndpointRequest)async throws->Data) {
            self.responseToRequest = responseToRequest
        }
        
        ///
        public func response
            (to request: RESTEndpointRequest)
        async throws -> Data {
            
            ///
            try await responseToRequest(request)
    
        }
    }
}

///
public extension Dummy {
    
    ///
    actor RequestAuthenticator: Interface_RESTEndpointRequestAuthenticator {
        
        ///
        static var dummyHeaders: [String: String] = ["dummy_auth": "abc123"]
        
        ///
        public func authenticateRequest
            (_ request: RESTEndpointRequest)
        async throws -> RESTEndpointRequest {
            
            ///
            return request
                .mutated { $0.headers = Self.dummyHeaders }
        }
    }
}
