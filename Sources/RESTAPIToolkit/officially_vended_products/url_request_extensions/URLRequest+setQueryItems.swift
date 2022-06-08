//
//  URLRequest+setQueryItems.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

// MARK: - URLRequest_setQueryItems -

public extension URLRequest {
    
    ///
    mutating func setQueryItems (to queryItems: URLQueryItems?) {
        self = self.settingQueryItems(to: queryItems)
    }
    
    ///
    func settingQueryItems (to queryItems: URLQueryItems?) -> URLRequest {
        self.setting(\.url, to: self.url?.settingQueryItems(to: queryItems))
    }
}


// MARK: - URL + URLQueryItems -

public extension URL {
    
    /// Returns a copy of the receiving `URL` with the query items changed to the given ones.
    ///
    /// This overload allows you to pass the query items as the result of an immediately invoked closure, which can be syntactically preferable in some situaitons.
    ///
    /// ```
    /// extension URL {
    ///     static func averagePriceEndpoint (symbol: String,
    ///                                       startDate: Date,
    ///                                       endDate: Date) -> URL {
    ///         baseURL
    ///             .appendingPathComponent("avg_price")
    ///             .settingQueryItems {
    ///                 URLQueryItems()
    ///                     .add("symbol", symbol)
    ///                     .add("start_date", startDate)
    ///                     .add("end_date", endDate)
    ///             }
    ///     }
    /// }
    /// ```
    func settingQueryItems (to queryItems: ()->URLQueryItems?) -> URL {
        settingQueryItems(to: queryItems())
    }
    
    /// Returns a copy of the receiving `URL` with the query items changed to the given ones.
    func settingQueryItems (to queryItems: URLQueryItems?) -> URL {
        URLComponents(
            url: self,
            resolvingAgainstBaseURL: false
        )?
            .setting(
                \.queryItems,
                to: queryItems
            )
            .url
        ??
            self
    }
}
