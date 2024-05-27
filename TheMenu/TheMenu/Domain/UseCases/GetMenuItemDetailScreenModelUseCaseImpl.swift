import Foundation

final class GetMenuItemDetailScreenModelUseCaseImpl: GetMenuItemDetailScreenModelUseCase {
    private let repository: MenuDetailsRepository

    init(repository: MenuDetailsRepository) {
        self.repository = repository
    }
    
    func execute(with itemId: Int) async throws -> ScreenModelData {
        do {
            return try await repository.fetchMenuDetails(itemId: itemId).toData()
        } catch {
            throw(ComponentError.unableToFetch)
        }
    }
}
