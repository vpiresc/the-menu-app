import XCTest
@testable import The_Menu

class NetworkserviceTest: XCTestCase {
    var sut: Webservice!
    
    override func setUp() {
        super.setUp()
        sut = Webservice()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_load_with_valid_path_should_success() async throws {
        do {
            _ = try await sut.load("http://localhost:3000/menu-list")
        } catch {
            XCTFail("This call should not throw an error.")
        }
    }
    
    func test_load_with_invalid_path_should_failure() async throws {
        do {
            _ = try await sut.load("http://localhost:3000/menu")
            XCTFail("This call should throw an error.")
        } catch {
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
}
