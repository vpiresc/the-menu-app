@testable import The_Menu
import XCTest

final class MenuItemDetailViewModelImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: MenuItemDetailViewModelImpl!
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuItemDetailScreenModelUseCaseMock!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuItemDetailScreenModelUseCaseMock()
        sut = MenuItemDetailViewModelImpl(useCase: useCaseMock)
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        useCaseMock = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_whenPrepareData_shouldCallUseCaseExecute() async {
        // Given
        let itemIdExpected = 1
        // When
        do {
            _ = try await sut.prepareData(itemId: itemIdExpected)
            // Then
            XCTAssertEqual(useCaseMock.executeWasCalled, 1)
            XCTAssertEqual(useCaseMock.itemId, itemIdExpected)
        } catch {
            fatalError("prepareData should not return any error")
        }
    }
}
