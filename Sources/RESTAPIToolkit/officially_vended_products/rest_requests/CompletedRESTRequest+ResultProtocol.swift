//
//  CompletedRESTRequest+ResultProtocol.swift
//  
//
//  Created by Jeremy Bannister on 7/31/21.
//

///
public extension CompletedRESTRequest where Request.Response: ResultProtocol {
    
    ///
    var wasSuccessful: Bool {
        (try? response().successfulValue.isNotNil) ?? false
    }
}
