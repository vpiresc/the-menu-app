import XCTest
@testable import The_Menu

final class MenuItemDetailViewModelTests: XCTestCase {
    var sut: MenuItemDetailViewModel!
    var service: WebserviceMock!
    
    @MainActor override func setUp() {
        super.setUp()
        service = WebserviceMock()
        sut = MenuItemDetailViewModel(service: service)
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
                "pageTitle": "The Menu",
                "components": [
                    {
                        "type": "featuredImage",
                        "data": {
                            "imageUrl": "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        }
                    }
                ]
            }
            """
        
        //When
        _ = await sut.load(itemId: 1)
        let components = await sut.components        
        let count = components.count
        
        //Then
        XCTAssertEqual(count, 1)
        XCTAssertNotNil(components)
    }
    
    func test_load_when_responseType_success_and_invalid_json_should_be_failure() async {
        // Given
        service.responseType = .success
        
        //When
        _ = await sut.load(itemId: 1)
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
                "pageTitle": "The Menu",
                "components": [
                    {
                        "type": "featuredImage",
                        "data": {
                            "imageUrl": "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        }
                    }
                ]
            }
            """
        
        //When
        _ = await sut.load(itemId: 1)
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
        _ = await sut.load(itemId: 1)
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
