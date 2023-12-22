import Foundation

final class GetMenuCommentsScreenModelUseCaseImpl: GetMenuCommentsScreenModelUseCase {
    private let repository: ScreenModelRepository
    
    init(repository: ScreenModelRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> ScreenModelData {
        do {
            return try await repository.fetchScreenModel(Constants.Urls.menuComments).toData()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
