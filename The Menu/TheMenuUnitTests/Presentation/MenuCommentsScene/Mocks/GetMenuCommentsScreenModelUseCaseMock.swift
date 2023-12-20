@testable import The_Menu

final class GetMenuCommentsScreenModelUseCaseMock: GetMenuCommentsScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData.init(pageTitle: "teste", components: [])
    
    func execute() async throws -> The_Menu.ScreenModelData {
        executeWasCalled += 1
        return screenModelData
    }
}
