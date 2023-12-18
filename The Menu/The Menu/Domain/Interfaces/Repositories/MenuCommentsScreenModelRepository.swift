import Foundation

protocol MenuCommentsScreenModelRepository {
    func fetchMenuCommentsScreenModel() async throws -> ScreenModelData
}
