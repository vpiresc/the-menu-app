import Foundation

final class GetMenuListScreenModelUseCaseImpl: GetMenuListScreenModelUseCase {
    private let repository: ScreenModelRepository

    init(repository: ScreenModelRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> ScreenModelData {
        do {
            return try await repository.fetchScreenModel().toData()
        } catch {
            throw(ComponentError.unableToFetch)
        }
    }
}
