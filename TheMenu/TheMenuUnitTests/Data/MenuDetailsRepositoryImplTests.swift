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
    
    func test_whenFetchMenuDetailsScreenModelWithValidData_shouldReturnScreenModelResponse() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            let screenModelResponse = try await sut.fetchMenuDetails(itemId: 0)
            
            // Then
            XCTAssertNotNil(screenModelResponse)
        } catch {
            fatalError("fetchScreenModel should not return any error")
        }
    }
    
    func test_whenFetchMenuDetailsScreenModelWithInValidData_shouldReturnError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Stubs.makeInvalidData(),
            response: Stubs.makeHttpResponse(),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuDetailsScreenModelWithNon200_shouldReturnNetworkError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 500),
            error: nil
        )
        
        // When
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
        }
    }
    
    func test_whenFetchMenuDetailsScreenModelWithAnyError_shouldReturnAnyError() async {
        // Given
        UrlProtocolMock.simulate(
            data: Data(Stubs.makefetchScreenModelStub().utf8),
            response: Stubs.makeHttpResponse(statusCode: 200),
            error: Stubs.makeError()
        )
        
        // When
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            
            fatalError("fetchScreenModel should not return any response")
        } catch {
            // Then
            XCTAssertEqual(error.localizedDescription, Stubs.makeError().localizedDescription)
        }
    }
}
