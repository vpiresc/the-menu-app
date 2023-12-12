import XCTest
@testable import The_Menu

final class MenuCommentsViewModelTests: XCTestCase {
    var sut: MenuCommentsViewModel!
    var service: WebserviceMock!
    
    @MainActor override func setUp() {
        super.setUp()
        service = WebserviceMock()
        sut = MenuCommentsViewModel(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
        sut = nil
    }
    
    func test_load_when_valid_json_should_be_success() async {
        // Given
        service.jsonResponse = """
             {
                 "pageTitle": "Comments",
                 "components": [
                             {
                                "type": "list",
                                "data": {
                                        "rows": [
                                                 {
                                                    "id": 1,
                                                    "title": "Appetizer",
                                                    "subTitle": "This is a great appetizer!",
                                                    "imageUrl": "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                                                    "description": "Every meal featured among this menu has a specific meaning behind it."
                                                 },
                                                 {
                                                    "id": 2,
                                                    "title": "Nice discount",
                                                    "subTitle": "This is a great discount!",
                                                    "imageUrl": "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                                                 },
                              ],
                                    "action": {
                                    "type": "push",
                                    "destination": "menuItemDetail"
                                 }
                             }
                         }
                     ]
             }
"""

//When
_ = await sut.load()
let components = await sut.components
let count = components.count

//Then
XCTAssertEqual(count, 1)
XCTAssertNotNil(components)
}

func test_load_when_valid_json_with_two_components_should_be_success() async {
// Given
    service.jsonResponse = """
    {
        "pageTitle": "Comments",
        "components": [
                    {
                        "type": "featuredImage",
                        "data": {
                        "imageUrl": "https://img.freepik.com/premium-vector/burger-social-media-feed-post-template_123371-177.jpg?w=2000"
                        }
                    },
                    {
                        "type": "list",
                        "data": {
                                "rows": [
                                {
                                            "id": 1,
                                            "title": "Appetizer",
                                            "subTitle": "This is a great appetizer!",
                                            "imageUrl": "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                                            "description": "Every meal featured among this menu has a specific meaning behind it."
                                },
                                {
                                            "id": 2,
                                            "title": "Nice discount",
                                            "subTitle": "This is a great discount!",
                                            "imageUrl": "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                                },
             ],
                                "action": {
                                            "type": "push",
                                            "destination": "menuItemDetail"
                        }
                    }
                }
            ]
    }
"""
        
        //When
        _ = await sut.load()
        let components = await sut.components
        let count = components.count
        
        //Then
        XCTAssertEqual(count, 2)
        XCTAssertNotNil(components)
    }
    
    func test_load_when_responseType_success_and_invalid_json_should_be_failure() async {
        // Given
        service.responseType = .success
        
        //When
        _ = await sut.load()
        let components = await sut.components
        let count = components.count
        
        //Then
        XCTAssertEqual(count, 0)
        XCTAssertEqual(
            service.error.localizedDescription,
            WebserviceErrorMock.unableToDecodeData.localizedDescription
        )
    }

    func test_load_when_responseType_failure_and_valid_json_should_be_failure() async {
        // Given
        service.responseType = .failure
        service.jsonResponse = """
                        {
                            "pageTitle": "Comments",
                                                    "components": [
                                        {
                                                            "type": "featuredImage",
                                                            "data": {
                                                                "imageUrl": "https://img.freepik.com/premium-vector/burger-social-media-feed-post-template_123371-177.jpg?w=2000"
                                            }
                                        },
                                        {
                                                            "type": "list",
                                                            "data": {
                                                                "rows": [
                                                    {
                                                                        "id": 1,
                                                                        "title": "Appetizer",
                                                                        "subTitle": "This is a great appetizer!",
                                                                        "imageUrl": "https://img.freepik.com/free-photo/pretty-woman-beret-sniffs-fragrant-donut-portrait-girl-with-curly-hair-isolated-red-wall_197531-14359.jpg?w=2000&t=st=1701959556~exp=1701960156~hmac=09c3d07cf36b5b302c459f1d3ba0d717cb6e1ea0f92fe14cc2c0899ca4f5c412",
                                                                        "description": "Every meal featured among this menu has a specific meaning behind it."
                                                    },
                                                    {
                                                                        "id": 2,
                                                                        "title": "Nice discount",
                                                                        "subTitle": "This is a great discount!",
                                                                        "imageUrl": "https://img.freepik.com/free-photo/attractive-woman-with-afro-hair-surrounded-by-peanut-butter-jellly-sandwiches_273609-36508.jpg?w=2000&t=st=1701959653~exp=1701960253~hmac=6aad1d5f30ff75e91299f171ed0cc8cdfc58dd8dd0ae9765563a5e2d30129559"
                                                    },
                                 ],
                                                           "action": {
                                                                "type": "push",
                                                                "destination": "menuItemDetail"
                                            }
                                        }
                                    }
                                ]
                        }
            """
        
        //When
        _ = await sut.load()
        let components = await sut.components
        let count = components.count
        
        //Then
        XCTAssertEqual(count, 0)
        XCTAssertEqual(
            service.error.localizedDescription,
            WebserviceErrorMock.responseFailure.localizedDescription
        )
    }
    
    func test_load_when_responseType_failure_and_invalid_json_should_be_failure() async {
        // Given
        service.responseType = .failure
        
        //When
        _ = await sut.load()
        let components = await sut.components
        let count = components.count
        
        //Then
        XCTAssertEqual(count, 0)
        XCTAssertEqual(
            service.error.localizedDescription,
            WebserviceErrorMock.responseFailure.localizedDescription
        )
    }
}
