@testable import TheMenu
import SwiftUI
import XCTest

final class MenuListViewTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuListScreenModelUseCaseMock!
    var viewModelSpy: MenuListViewModelSpy!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuListScreenModelUseCaseMock()
        viewModelSpy = MenuListViewModelSpy()
    }
    
    override func tearDown() {
        repositoryMock = nil
        useCaseMock = nil
        viewModelSpy = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    @MainActor func test_displayData_callsPrepareData() async {
        let sut = MenuListView(viewModel: viewModelSpy)
        
        _ = await sut.displayData()
        
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
    }
}
