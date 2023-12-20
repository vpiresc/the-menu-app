import Foundation

@MainActor
class MenuListViewModelImpl: MenuListViewModel {
    @Published var pageTitle: String = ""
    @Published var components: [UIComponent] = []
    
    private let useCase: GetMenuListScreenModelUseCase
    
    init(useCase: GetMenuListScreenModelUseCase) {
        self.useCase = useCase
    }
}

extension MenuListViewModelImpl {
    func prepareData() async throws {
        do {
            let screenModelData = try await useCase.execute()
            pageTitle = screenModelData.pageTitle
            components = try screenModelData.buildComponents()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
