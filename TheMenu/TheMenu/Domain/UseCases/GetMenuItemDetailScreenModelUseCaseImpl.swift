import Foundation

final class GetMenuItemDetailScreenModelUseCaseImpl: GetMenuItemDetailScreenModelUseCase {
    private let repository: ScreenModelRepository

    init(repository: ScreenModelRepository) {
        self.repository = repository
    }
    
    func execute(with itemId: Int) async throws -> ScreenModelData {
        do {
            return try await repository.fetchScreenModel(Constants.Urls.menuItemDetail(itemId: itemId)).toData()
        } catch {
            throw(ComponentError.unableToFetch)
        }
    }
}
