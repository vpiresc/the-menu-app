@testable import TheMenu
import SwiftUI
import XCTest

@MainActor
final class MenuCommentsViewTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var repositoryMock: ScreenModelRepositoryMock!
    var useCaseMock: GetMenuCommentsScreenModelUseCaseMock!
    var viewModelSpy: MenuCommentsViewModelSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
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
    
    func test_whenDisplayData_shouldCallPrepareData() async {
        // Given
        let sut = MenuCommentsView(viewModel: viewModelSpy)
        
        // When
        _ = await sut.displayData()
        
        // Then
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
    }
}
