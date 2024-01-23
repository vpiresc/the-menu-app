@testable import TheMenu

final class MenuCommentsViewModelSpy: MenuCommentsViewModel {
    var pageTitle: String = ""
    var components: [UIComponent] = []
    var prepareDataWasCalled = 0
    
    func prepareData() async {
        prepareDataWasCalled += 1
    }
}
