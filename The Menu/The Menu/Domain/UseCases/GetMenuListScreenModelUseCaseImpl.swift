import Foundation

final class GetMenuListScreenModelUseCaseImpl: ObservableObject, GetMenuListScreenModelUseCase {
    private let repository: ScreenModelRepository
    @Published private var components: [UIComponent] = []

    init(repository: ScreenModelRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [UIComponent] {
        do {
            let screenModelData = try await repository.fetchScreenModel(Constants.Urls.menuList)
            components = try await screenModelData.buildComponents()
            return components
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
