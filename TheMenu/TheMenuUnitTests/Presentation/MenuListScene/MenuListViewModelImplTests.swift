@testable import TheMenu
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
    
    func test_prepareData_callsUseCaseExecute() async {
        do {
            _ = try await sut.prepareData()
            XCTAssertEqual(useCaseMock.executeWasCalled, 1)
        } catch {
            XCTFail("prepareData should not return any error")
        }
    }
}
