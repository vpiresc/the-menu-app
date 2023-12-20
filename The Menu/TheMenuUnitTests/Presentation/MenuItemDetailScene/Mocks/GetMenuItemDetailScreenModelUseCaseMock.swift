@testable import The_Menu

final class GetMenuItemDetailScreenModelUseCaseMock: GetMenuItemDetailScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData(pageTitle: "teste", components: [])
    var itemId: Int = 0
    
    func execute(with itemId: Int) async throws -> The_Menu.ScreenModelData {
        executeWasCalled += 1
        self.itemId = itemId
        return screenModelData
    }
}
