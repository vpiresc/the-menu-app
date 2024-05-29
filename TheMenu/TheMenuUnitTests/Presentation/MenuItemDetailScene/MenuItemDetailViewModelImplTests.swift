@testable import TheMenu
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
    
    func test_prepareData_callsUseCaseExecute() async {
        let itemIdExpected = 1
        do {
            _ = try await sut.prepareData(itemId: itemIdExpected)
            XCTAssertEqual(useCaseMock.executeWasCalled, 1)
            XCTAssertEqual(useCaseMock.itemId, itemIdExpected)
        } catch {
            XCTFail("prepareData should not return any error")
        }
    }
}
