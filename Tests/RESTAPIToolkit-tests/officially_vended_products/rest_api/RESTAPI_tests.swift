//
//  RESTAPI_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/7/22.
//

///
final class RESTAPI_tests: SingleTypeTestCase {
    
    ///
    typealias Subject = RESTAPI
    
    ///
    func test_0 () async throws {
        _ = try await
            Subject(baseURL: .init(string: "https://dummy.restapiexample.com/api/v1/")!)
                .response(
                    to: .init(
                        endpoint: .init(["employees"]),
                        method: "GET",
                        headers: nil,
                        queryItems: nil,
                        bodyData: nil
                    )
                )
                .jsonDecoded(as: Response_Dummy_GET_employees.self)
                .handled { try $0.assert(\.status, equals: "success") }
                .data
                .assert(\.isEmpty, equals: false)
    }
    
    ///
    struct Response_Dummy_GET_employees:
        ProperValueType,
        Testable {
        
        var status: String
        var data: [Employee]
        
        struct Employee: ProperValueType {
            var id: Int
            var employee_name: String
            var employee_salary: Double
            var employee_age: Int
            var profile_image: String
        }
    }
}
