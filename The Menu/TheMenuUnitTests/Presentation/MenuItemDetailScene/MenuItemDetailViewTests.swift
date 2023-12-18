@testable import The_Menu
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
    
    func test_whenDisplayData_shouldCallPrepareData() async {
        // Given
        let itemIdExpected = 1
        
        // Given
        let sut = MenuItemDetailView(viewModel: viewModelSpy, itemId: itemIdExpected)
        
        // When
        _ = await sut.displayData(itemId: itemIdExpected)
        
        // Then
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
        XCTAssertEqual(viewModelSpy.itemId, itemIdExpected)
    }
}
