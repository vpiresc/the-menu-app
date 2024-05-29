@testable import TheMenu
import XCTest

final class MenuCommentsViewModelImplTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: MenuCommentsViewModelImpl!
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuCommentsScreenModelUseCaseMock!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuCommentsScreenModelUseCaseMock()
        sut = MenuCommentsViewModelImpl(useCase: useCaseMock)
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
