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
        let result = await resultValuesFor(
            sut,
            Data(Stubs.makefetchScreenModelStub().utf8),
            Stubs.makeHttpResponse(),
            nil)
        
        XCTAssertNotNil(result)
    }
    
    func test_fetchMenuDetails_failsWithErrorWithInValidData() async {
        let result = await resultErrorFor(
            sut, Stubs.makeInvalidData(),
            Stubs.makeHttpResponse(),
            nil)
        
        XCTAssertNotNil(result)
    }
    
    func test_fetchMenuDetails_failsWithNetworkErrorWithNon200() async {
        let result = await resultErrorFor(
            sut, Data(Stubs.makefetchScreenModelStub().utf8),
            Stubs.makeHttpResponse(statusCode: 500),
            nil)
        
        XCTAssertEqual(result?.localizedDescription, NetworkError.invalidServerResponse.localizedDescription)
    }
    
    func test_fetchMenuDetails_failsWithAnyError() async {
        let result = await resultErrorFor(
            sut, Data(Stubs.makefetchScreenModelStub().utf8),
            Stubs.makeHttpResponse(statusCode: 200),
            Stubs.makeError())
        
        XCTAssertEqual(result?.localizedDescription, Stubs.makeError().localizedDescription)
    }
    
    // MARK: - Helpers
    
    private func resultErrorFor(_ sut: MenuDetailsRepository, _ data: Data?, _ response: HTTPURLResponse?, _ error: Error?, file: StaticString = #filePath, line: UInt = #line) async -> Error? {
        UrlProtocolMock.simulate(
            data: data,
            response: response,
            error: error
        )
        
        do {
            _ = try await sut.fetchMenuDetails(itemId: 0)
            XCTFail("fetchScreenModel should not return any response", file: file, line: line)
            return nil
        } catch {
            return error
        }
    }
    
    private func resultValuesFor(_ sut: MenuDetailsRepository, _ data: Data?, _ response: HTTPURLResponse?, _ error: Error?, file: StaticString = #filePath, line: UInt = #line) async -> ScreenModelResponse? {
        UrlProtocolMock.simulate(
            data: data,
            response: response,
            error: error
        )
        
        do {
            let screenModel = try await sut.fetchMenuDetails(itemId: 0)
            return screenModel
        } catch {
            XCTFail("fetchScreenModel should not return any error", file: file, line: line)
            return nil
        }
    }
}
