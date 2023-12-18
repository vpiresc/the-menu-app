import Foundation

protocol MenuListScreenModelRepository {
    func fetchMenuListScreenModel(source: String) async throws -> ScreenModelData
}
