@testable import TheMenu
import XCTest

final class GetMenuListScreenModelUseCaseImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: GetMenuListScreenModelUseCase!
    var repositoryMock: ScreenModelRepositoryMock!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        sut = GetMenuListScreenModelUseCaseImpl(repository: repositoryMock)
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_getMenuListScreenModel_returnsScreenModelWithOneComponent() async {
        let screenModel = await resultValuesFor(sut, .success, Stubs.makefetchScreenModelStub())
        
        XCTAssertNotNil(screenModel)
        XCTAssertEqual(screenModel?.components.count, 1)
    }
    
    func test_getMenuListScreenModel_returnsScreenModelWithTwoComponents() async {
        let screenModel = await resultValuesFor(sut, .success, Stubs.makefetchScreenOfTwoModelStub())
        
        XCTAssertNotNil(screenModel)
        XCTAssertEqual(screenModel?.components.count, 2)
    }
    
    func test_getMenuListScreenModel_failsWithAnErrorWithSuccessAndEmptyResponse() async {
        let result = await resultErrorFor(sut, .success, "")
        
        XCTAssertNotNil(result)
    }
    
    func test_getMenuListScreenModel_failsWithAnErrorWithFailureAndEmptyResponse() async {
        let result = await resultErrorFor(sut, .failure, "")
        
        XCTAssertNotNil(result)
    }
    
    func test_getMenuListScreenModel_failsWithAnErrorWithFailureAndValidResponse() async {
        let result = await resultErrorFor(sut, .failure, Stubs.makefetchScreenModelStub())
        
        XCTAssertNotNil(result)
    }
    
    // MARK: - Helpers
    
    private func resultErrorFor(_ sut: GetMenuListScreenModelUseCase, _ responseType: ResponseType, _ jsonResponse: String, file: StaticString = #filePath, line: UInt = #line) async -> Error? {
        repositoryMock.responseType = responseType
        repositoryMock.jsonResponse = jsonResponse
        
        do {
            _ = try await sut.execute()
            XCTFail("execute should not return any response", file: file, line: line)
            return nil
        } catch {
            return error
        }
    }
    
    private func resultValuesFor(_ sut: GetMenuListScreenModelUseCase, _ responseType: ResponseType, _ jsonResponse: String, file: StaticString = #filePath, line: UInt = #line) async -> ScreenModelData? {
        repositoryMock.responseType = responseType
        repositoryMock.jsonResponse = jsonResponse
        
        do {
            let screenModel = try await sut.execute()
            return screenModel
        } catch {
            XCTFail("execute should not return any error", file: file, line: line)
            return nil
        }
    }
}
