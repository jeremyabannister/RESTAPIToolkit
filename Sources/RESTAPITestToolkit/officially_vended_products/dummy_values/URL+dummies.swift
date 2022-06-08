//
//  File.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension URL {
    
    ///
    static var testURL: Self {
        .webURL(
            scheme: .https,
            host: "apple.com"
        )!
    }
}
