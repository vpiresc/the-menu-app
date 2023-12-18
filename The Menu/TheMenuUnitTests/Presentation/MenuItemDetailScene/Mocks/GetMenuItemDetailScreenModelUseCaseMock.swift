@testable import The_Menu

final class GetMenuItemDetailScreenModelUseCaseMock: GetMenuItemDetailScreenModelUseCase {
    var executeWasCalled = 0
    let uiComponent: [UIComponent] = []
    var itemId: Int = 0
    
    func execute(with itemId: Int) async throws -> [The_Menu.UIComponent] {
        executeWasCalled += 1
        self.itemId = itemId
        return uiComponent
    }
}
