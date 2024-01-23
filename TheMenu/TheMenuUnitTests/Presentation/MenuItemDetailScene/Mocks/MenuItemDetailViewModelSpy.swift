@testable import TheMenu

final class MenuItemDetailViewModelSpy: MenuItemDetailViewModel {
    var components: [UIComponent] = []
    var prepareDataWasCalled = 0
    var itemId = 0
    
    func prepareData(itemId: Int) async {
        prepareDataWasCalled += 1
        self.itemId = itemId
    }
}
