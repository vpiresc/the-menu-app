@testable import TheMenu

final class GetMenuCommentsScreenModelUseCaseMock: GetMenuCommentsScreenModelUseCase {
    var executeWasCalled = 0
    let screenModelData = ScreenModelData.init(pageTitle: "teste", components: [])
    
    func execute() async throws -> ScreenModelData {
        executeWasCalled += 1
        return screenModelData
    }
}
