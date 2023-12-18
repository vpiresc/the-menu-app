import Foundation

protocol MenuItemDetailScreenModelRepository {
    func fetchMenuItemDetailScreenModel(with itemId: Int) async throws -> ScreenModelData
}
