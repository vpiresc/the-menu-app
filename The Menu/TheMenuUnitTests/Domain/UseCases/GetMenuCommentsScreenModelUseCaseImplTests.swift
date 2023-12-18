@testable import The_Menu
import XCTest

final class GetMenuCommentsScreenModelUseCaseImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: GetMenuCommentsScreenModelUseCase!
    var repositoryMock: ScreenModelRepositoryMock!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        sut = GetMenuCommentsScreenModelUseCaseImpl(repository: repositoryMock)
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_whenFetchMenuListScreenModelSuccessAndValidResponse_shouldReturnScreenModelWithOneComponent() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = Stubs.makefetchScreenModelStub()
        
        // When
        do {
            let screenModel = try await sut.execute()
            // Then
            XCTAssertNotNil(screenModel)
            XCTAssertEqual(screenModel.count, 1)
        } catch {
            fatalError("execute should not return any error")
        }
    }
    
    func test_whenFetchMenuListScreenModelSuccessAndValidResponse_shouldReturnScreenModelWithTwoComponents() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = Stubs.makefetchScreenOfTwoModelStub()
        
        // When
        do {
            let screenModel = try await sut.execute()
            // Then
            XCTAssertNotNil(screenModel)
            XCTAssertEqual(screenModel.count, 2)
        } catch {
            fatalError("execute should not return any error")
        }
    }
    
    func test_whenFetchMenuListScreenModelSuccessAndInvalidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = ""
        
        // When
        do {
            _ = try await sut.execute()
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuListScreenModelFailureAndInvalidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .failure
        repositoryMock.jsonResponse = ""
        
        // When
        do {
            _ = try await sut.execute()
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuListScreenModelFailureAndValidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .failure
        repositoryMock.jsonResponse = Stubs.makefetchScreenModelStub()
        
        // When
        do {
            _ = try await sut.execute()
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
}
