//
//  CompletedRESTRequest.swift
//
//
//  Created by Jeremy Bannister on 3/7/21.
//

///
public typealias CompletedRESTRequest <Request: RESTEndpointRequestEncodable> =
    _CompletedRESTRequest<Request, RawRESTResponse>

///
public extension _CompletedRESTRequest where Response == RawRESTResponse {
    
    ///
    var asSuccessfulRequest: SuccessfulRESTRequest<Request>? {
        switch self.asSuccessOrFailure {
        case .success (let successfulRequest):
            return successfulRequest
            
        case .failure:
            return nil
        }
    }
    
    ///
    var asFailedRequest: FailedRESTRequest<Request>? {
        switch self.asSuccessOrFailure {
        case .failure (let failedRequest):
            return failedRequest
            
        case .success:
            return nil
        }
    }
    
    ///
    var asSuccessOrFailure: Result<SuccessfulRESTRequest<Request>, FailedRESTRequest<Request>> {
        switch result() {
        case .success (let successfulResponse):
            return
                .success(
                    .init(
                        request: request,
                        response: successfulResponse,
                        dateInitiated: dateInitiated,
                        dateCompleted: dateCompleted
                    )
                )
            
        case .failure (let error):
            return
                .failure(
                    .init(
                        request: request,
                        response: error,
                        dateInitiated: dateInitiated,
                        dateCompleted: dateCompleted
                    )
                )
        }
    }
    
    ///
    func result () -> Request.RESTResult {
        switch response {
        case .success (let data):
            if let successfulValue = request.parseSuccessfulResponse(from: data) {
                return .success(successfulValue)
            } else if let standardError = request.parseStandardError(from: data) {
                return .failure(.understood(standardError: standardError))
            } else {
                return .failure(.uninterpretable(rawData: data))
            }
        case .failure (let networkError):
            return .failure(.networkError(networkError))
        }
    }
    
    ///
    var wasSuccessful: Bool {
        result().successfulValue.isNotNil
    }
}
