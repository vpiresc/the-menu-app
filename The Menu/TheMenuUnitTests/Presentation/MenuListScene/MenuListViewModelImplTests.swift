@testable import The_Menu
import XCTest

final class MenuListViewModelImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: MenuListViewModelImpl!
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuListScreenModelUseCaseMock!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuListScreenModelUseCaseMock()
        sut = MenuListViewModelImpl(useCase: useCaseMock)
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        useCaseMock = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_whenPrepareData_shouldCallUseCaseExecute() async {
        // When
        do {
           _ = try await sut.prepareData()
            // Then
            XCTAssertEqual(useCaseMock.executeWasCalled, 1)
        } catch {
            fatalError("prepareData should not return any error")
        }
    }
}
