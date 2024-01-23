@testable import TheMenu

final class GetMenuItemDetailScreenModelUseCaseMock: GetMenuItemDetailScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData(pageTitle: "teste", components: [])
    var itemId: Int = 0
    
    func execute(with itemId: Int) async throws -> ScreenModelData {
        executeWasCalled += 1
        self.itemId = itemId
        return screenModelData
    }
}
