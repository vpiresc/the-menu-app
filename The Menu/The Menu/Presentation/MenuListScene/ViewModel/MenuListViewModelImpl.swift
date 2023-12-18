import Foundation

@MainActor
class MenuListViewModelImpl: MenuListViewModel {
    @Published var components: [UIComponent] = []
    
    private let useCase: GetMenuListScreenModelUseCase
    
    init(useCase: GetMenuListScreenModelUseCase) {
        self.useCase = useCase
    }
}

extension MenuListViewModelImpl {
    func prepareData() async throws {
        do {
            components = try await useCase.execute()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
