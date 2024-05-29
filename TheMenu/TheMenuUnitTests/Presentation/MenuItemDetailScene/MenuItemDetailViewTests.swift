@testable import TheMenu
import SwiftUI
import XCTest

@MainActor
final class MenuItemDetailViewTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuItemDetailScreenModelUseCaseMock!
    var viewModelSpy: MenuItemDetailViewModelSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        repositoryMock = ScreenModelRepositoryMock()
        useCaseMock = GetMenuItemDetailScreenModelUseCaseMock()
        viewModelSpy = MenuItemDetailViewModelSpy()
    }
    
    override func tearDown() {
        repositoryMock = nil
        useCaseMock = nil
        viewModelSpy = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_displayData_callsPrepareData() async {
        let itemIdExpected = 1
        
        let sut = MenuItemDetailView(viewModel: viewModelSpy, itemId: itemIdExpected)
        
        _ = await sut.displayData(itemId: itemIdExpected)
        
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
        XCTAssertEqual(viewModelSpy.itemId, itemIdExpected)
    }
}
