@testable import TheMenu
import SwiftUI
import XCTest

final class MenuCommentsViewTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuCommentsScreenModelUseCaseMock!
    var viewModelSpy: MenuCommentsViewModelSpy!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuCommentsScreenModelUseCaseMock()
        viewModelSpy = MenuCommentsViewModelSpy()
    }
    
    override func tearDown() {
        repositoryMock = nil
        useCaseMock = nil
        viewModelSpy = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    @MainActor func test_displayData_callsPrepareData() async {
        let sut = MenuCommentsView(viewModel: viewModelSpy)
        
        _ = await sut.displayData()
        
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
    }
}
