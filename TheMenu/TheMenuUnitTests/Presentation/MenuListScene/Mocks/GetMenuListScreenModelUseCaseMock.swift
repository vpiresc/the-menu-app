@testable import TheMenu

final class GetMenuListScreenModelUseCaseMock: GetMenuListScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData(pageTitle: "teste", components: [])
    
    func execute() async throws -> ScreenModelData {
        executeWasCalled += 1
        return screenModelData
    }
}
