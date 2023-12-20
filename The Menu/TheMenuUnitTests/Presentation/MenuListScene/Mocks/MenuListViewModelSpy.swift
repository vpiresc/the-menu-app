@testable import The_Menu

final class MenuListViewModelSpy: MenuListViewModel {
    var pageTitle: String = ""
    var components: [The_Menu.UIComponent] = []
    var prepareDataWasCalled = 0
    
    func prepareData() async {
        prepareDataWasCalled += 1
    }
}
