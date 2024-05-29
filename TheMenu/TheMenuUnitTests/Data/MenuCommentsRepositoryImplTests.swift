@testable import TheMenu
import XCTest


final class MenuCommentsRepositoryImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: MenuCommentsRepository!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolMock.self]
        let session = URLSession(configuration: config)
        sut = MenuCommentsRepositoryImpl(session: session)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_fetchMenuComments_returnsScreenModelResponse() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        do {
            let screenModelResponse = try await sut.fetchMenuComments()
            
            // Then
            XCTAssertNotNil(screenModelResponse)
        } catch {
            XCTFail("fetchScreenModel should not return any error")
        }
    }
    
    func test_fetchMenuComments_failsWithErrorWithInValidData() async {
        UrlProtocolMock.simulate(
            data: Stubs.makeInvalidData(),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        do {
            _ = try await sut.fetchMenuComments()
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func test_fetchMenuComments_failsWithNetworkErrorWithNon200() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 500),
            error: nil
        )
        
        do {
            _ = try await sut.fetchMenuComments()
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
    
    func test_fetchMenuComments_failsWithAnyError() async {
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: Stubs.makeError()
        )
        
        do {
            _ = try await sut.fetchMenuComments()
            
            XCTFail("fetchScreenModel should not return any response")
        } catch {
            XCTAssertEqual(error.localizedDescription, Stubs.makeError().localizedDescription)
        }
    }
}
