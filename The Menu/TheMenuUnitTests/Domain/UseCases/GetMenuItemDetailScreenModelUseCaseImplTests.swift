@testable import The_Menu
import XCTest

final class GetMenuItemDetailScreenModelUseCaseImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: GetMenuItemDetailScreenModelUseCase!
    var         repositoryMock: ScreenModelRepositoryMock!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupMenuItemDetailScreenModelRepository()
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupMenuItemDetailScreenModelRepository() {
        repositoryMock = ScreenModelRepositoryMock()
        sut = GetMenuItemDetailScreenModelUseCaseImpl(repository:         repositoryMock)
    }
    
    // MARK: Tests
    
    func test_whenFetchMenuItemDetailScreenModelSuccessAndValidResponse_shouldReturnScreenModelWithOneComponent() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = Stubs.makefetchScreenModelStub()
        
        // When
        do {
            let screenModel = try await sut.execute(with: 1)
            // Then
            XCTAssertNotNil(screenModel)
            XCTAssertEqual(screenModel.count, 1)
        } catch {
            fatalError("execute should not return any error")
        }
    }
    
    func test_whenFetchMenuItemDetailScreenModelSuccessAndValidResponse_shouldReturnScreenModelWithTwoComponents() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = Stubs.makefetchScreenOfTwoModelStub()
        
        // When
        do {
            let screenModel = try await sut.execute(with: 1)
            // Then
            XCTAssertNotNil(screenModel)
            XCTAssertEqual(screenModel.count, 2)
        } catch {
            fatalError("execute should not return any error")
        }
    }
    
    func test_whenFetchMenuItemDetailScreenModelSuccessAndInvalidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .success
        repositoryMock.jsonResponse = ""
        
        // When
        do {
            _ = try await sut.execute(with: 1)
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuItemDetailScreenModelFailureAndInvalidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .failure
        repositoryMock.jsonResponse = ""
        
        // When
        do {
            _ = try await sut.execute(with: 1)
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func test_whenFetchMenuItemDetailScreenModelFailureAndValidResponse_shouldReturnAnError() async {
        // Given
        repositoryMock.responseType = .failure
        repositoryMock.jsonResponse = Stubs.makefetchScreenModelStub()
        
        // When
        do {
            _ = try await sut.execute(with: 1)
            // Then
            XCTFail("execute should not return any response")
        } catch {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
}
