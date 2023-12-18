@testable import The_Menu

final class GetMenuCommentsScreenModelUseCaseMock: GetMenuCommentsScreenModelUseCase {
    var executeWasCalled = 0
    let uiComponent: [UIComponent] = []
    
    func execute() async throws -> [The_Menu.UIComponent] {
        executeWasCalled += 1
        return uiComponent
    }
}
