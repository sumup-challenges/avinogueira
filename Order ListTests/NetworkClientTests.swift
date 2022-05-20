import XCTest
@testable import Order_List

class NetworkClientTests: XCTestCase {

    func testEndpoint() {
        let networkClient = NetworkClient()
        let expectedResponse = try! JSONDecoder().decode([Order].self, from: expectedResponseData)

        networkClient.getOrders { result in
            guard case let .success(orders) = result else {
                XCTFail()
                return
            }
            XCTAssertEqual(expectedResponse, orders)
        }
    }
}

private let expectedResponseData = "[\r\n  {\r\n    \"deliveryType\": \"delivery\",\r\n    \"id\": \"686A057F-63FA-49FE-B4B5-252DE4CF229B\",\r\n    \"storeID\": 1004,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 1.45,\r\n    \"date\": 641471058.243066\r\n  },\r\n  {\r\n    \"deliveryType\": \"delivery\",\r\n    \"id\": \"F42C3CD7-1743-43F4-90C0-F7A7B291F68E\",\r\n    \"storeID\": 1005,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 1.45,\r\n    \"date\": 641471058.2438\r\n  },\r\n  {\r\n    \"deliveryType\": \"delivery\",\r\n    \"id\": \"33E8669B-16B6-430A-A8BB-E361B3F3E4F4\",\r\n    \"storeID\": 1006,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 5.5,\r\n    \"date\": 641471058.2438\r\n  },\r\n  {\r\n    \"deliveryType\": \"pickup\",\r\n    \"id\": \"4B39BFB8-BFA1-49B1-8590-09FC2013C959\",\r\n    \"storeID\": 1007,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 12,\r\n    \"date\": 641471058.243801\r\n  },\r\n  {\r\n    \"deliveryType\": \"delivery\",\r\n    \"id\": \"9B08386F-DA61-49EF-A973-92C7E3076816\",\r\n    \"storeID\": 1008,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      },\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 45.1,\r\n    \"date\": 641471058.243802\r\n  },\r\n  {\r\n    \"deliveryType\": \"pickup\",\r\n    \"id\": \"4DDB57E9-C8F0-4BEB-AAA8-84AE9EB58A5B\",\r\n    \"storeID\": 1009,\r\n    \"items\": [\r\n      {\r\n        \"name\": \"default name\"\r\n      }\r\n    ],\r\n    \"price\": 100.56,\r\n    \"date\": 641471058.243802\r\n  }\r\n]".data(using: .utf8)!
