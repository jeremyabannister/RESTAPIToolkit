//
//  Data+dummies.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension Data {
    
    ///
    static var dummyBodyData: Self {
        "{a:123,b:true}".utf8Data
    }
}
