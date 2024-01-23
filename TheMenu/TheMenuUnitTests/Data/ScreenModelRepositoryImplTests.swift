@testable import TheMenu
import XCTest


final class ScreenModelRepositoryImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: ScreenModelRepository!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [UrlProtocolMock.self]
        let session = URLSession(configuration: config)
        sut = ScreenModelRepositoryImpl(session: session)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_whenFetchMenuListScreenModelWithValidData_shouldReturnScreenModelResponse() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            let screenModelResponse = try await sut.fetchScreenModel(Stubs.makeUrl().absoluteString)
            
            // Then
            XCTAssertNotNil(screenModelResponse)
        } catch {
            fatalError("fetchScreenModel should not return any error")
        }
    }
    
    func test_whenFetchMenuListScreenModelWithInValidData_shouldReturnError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Stubs.makeInvalidData(),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchScreenModel(Stubs.makeUrl().absoluteString)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuListScreenModelWithNon200_shouldReturnNetworkError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 500),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchScreenModel(Stubs.makeUrl().absoluteString)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
    
    func test_whenFetchMenuListScreenModelWithInvalidUrl_shouldReturnNetworkError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchScreenModel("")
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidUrl.localizedDescription)
        }
    }
    
    func test_whenFetchMenuListScreenModelWithAnyError_shouldReturnAnyError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: Stubs.makeError()
        )
        
        // When
        do {
            _ = try await sut.fetchScreenModel(Stubs.makeUrl().absoluteString)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, Stubs.makeError().localizedDescription)
        }
    }
}
