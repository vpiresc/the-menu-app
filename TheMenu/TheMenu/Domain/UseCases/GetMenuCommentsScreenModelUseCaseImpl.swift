import Foundation

final class GetMenuCommentsScreenModelUseCaseImpl: GetMenuCommentsScreenModelUseCase {
    private let repository: MenuCommentsRepository
    
    init(repository: MenuCommentsRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> ScreenModelData {
        do {
            return try await repository.fetchMenuComments().toData()
        } catch {
            throw(ComponentError.unableToFetch)
        }
    }
}
