import Foundation

final class GetMenuItemDetailScreenModelUseCaseImpl: ObservableObject, GetMenuItemDetailScreenModelUseCase {
    private let repository: ScreenModelRepository
    @Published private var components: [UIComponent] = []

    init(repository: ScreenModelRepository) {
        self.repository = repository
    }
    
    func execute(with itemId: Int) async throws -> [UIComponent] {
        do {
            let screenModelData = try await repository.fetchScreenModel(Constants.Urls.menuItemDetail(itemId: itemId))
            components = try await screenModelData.buildComponents()
            return components
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
