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
    
    func test_whenFetchMenuCommentsScreenModelWithValidData_shouldReturnScreenModelResponse() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            let screenModelResponse = try await sut.fetchMenuComments()
            
            // Then
            XCTAssertNotNil(screenModelResponse)
        } catch {
            fatalError("fetchScreenModel should not return any error")
        }
    }
    
    func test_whenFetchMenuCommentsScreenModelWithInValidData_shouldReturnError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Stubs.makeInvalidData(),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchMenuComments()
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuCommentsScreenModelWithNon200_shouldReturnNetworkError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 500),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchMenuComments()
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
    
    func test_whenFetchMenuCommentsScreenModelWithAnyError_shouldReturnAnyError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: Stubs.makeError()
        )
        
        // When
        do {
            _ = try await sut.fetchMenuComments()
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, Stubs.makeError().localizedDescription)
        }
    }
}
