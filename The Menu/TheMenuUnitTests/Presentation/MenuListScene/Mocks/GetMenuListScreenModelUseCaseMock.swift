@testable import The_Menu

final class GetMenuListScreenModelUseCaseMock: GetMenuListScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData(pageTitle: "teste", components: [])
    
    func execute() async throws -> The_Menu.ScreenModelData {
        executeWasCalled += 1
        return screenModelData
    }
}
