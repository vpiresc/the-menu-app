@testable import TheMenu
import XCTest


final class MenuDetailsRepositoryImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: MenuDetailsRepository!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolMock.self]
        let session = URLSession(configuration: config)
        sut = MenuDetailsRepositoryImpl(session: session)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_fetchMenuDetails_returnsScreenModelResponse() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        do {
            let screenModelResponse = try await sut.fetchMenuDetails(itemId: 0)
            
            XCTAssertNotNil(screenModelResponse)
        } catch {
            XCTFail("fetchScreenModel should not return any error")
        }
    }
    
    func test_fetchMenuDetails_failsWithErrorWithInValidData() async {
        UrlProtocolMock.simulate(
            data: Stubs.makeInvalidData(),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func test_fetchMenuDetails_failsWithNetworkErrorWithNon200() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 500),
            error: nil
        )
        
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
    
    func test_fetchMenuDetails_failsWithAnyError() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: Stubs.makeError()
        )
        
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertEqual(error.localizedDescription, Stubs.makeError().localizedDescription)
        }
    }
}
