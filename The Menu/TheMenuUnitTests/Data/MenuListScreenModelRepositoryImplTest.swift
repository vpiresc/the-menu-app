//@testable import The_Menu
//import XCTest
//
//final class MenuListScreenModelRepositoryImplTest: XCTestCase {
//    // MARK: - Subject under test
//    
//    var sut: ScreenModelRepository!
//    var service: ServiceMock!
//    
//    // MARK: - Test lifecycle
//    
//    override func setUp() {
//        super.setUp()
//        setupMenuListScreenModelRepository()
//    }
//    
//    override func tearDown() {
//        sut = nil
//        service = nil
//        super.tearDown()
//    }
//    
//    // MARK: - Test setup
//    
//    func setupMenuListScreenModelRepository() {
//        sut = ScreenModelRepositoryImpl()
//        service = ServiceMock()
//    }
//    
//    // MARK: - Stubs
//    
//    let fetchMenuListScreenModelStub = ""
//    
//    // MARK: Tests
//    
//    func testWhenFetchMenuListScreenModelSuccessShouldReturnScreenModel() async {
//        // Given
//        service.responseType = .success
//        service.jsonResponse = """
//                    {
//                        "pageTitle": "The Menu",
//                        "components": [
//                            {
//                                "type": "featuredImage",
//                                "data": {
//                                    "imageUrl": "https://plus.unsplash.com/premium_photo-1667682942148-a0c98d1d70db?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
//                                }
//                            }
//                        ]
//                    }
//                    """
//        
//        // When
//        do {
//            let screenModel = try await sut.fetchScreenModel(Constants.Urls.menuList)
//            // Then
//            XCTAssertNotNil(screenModel)
//            XCTAssertEqual(screenModel.components.count, 1)
////            sut.
//        } catch {
//            XCTAssertEqual(error as! NetworkError, NetworkError.invalidUrl)
//        }
////        let components = await sut.components
////        let count = components.count
////        // Then
////        XCTAssertEqual(count, 1)
////
////        XCTAssertNotNil(components)
//    }
//    
//}
