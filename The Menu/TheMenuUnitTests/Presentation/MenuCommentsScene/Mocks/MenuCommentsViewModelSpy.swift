@testable import The_Menu

final class MenuCommentsViewModelSpy: MenuCommentsViewModel {
    var components: [The_Menu.UIComponent] = []
    var prepareDataWasCalled = 0
    
    func prepareData() async {
        prepareDataWasCalled += 1
    }
}
