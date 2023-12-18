@testable import The_Menu
import SwiftUI
import XCTest

@MainActor
final class MenuListViewTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuListScreenModelUseCaseMock!
    var viewModelSpy: MenuListViewModelSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
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
    
    func test_whenDisplayData_shouldCallPrepareData() async {
        // Given
        let sut = MenuListView(viewModel: viewModelSpy)
        
        // When
        _ = await sut.displayData()
        
        // Then
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
    }
}
