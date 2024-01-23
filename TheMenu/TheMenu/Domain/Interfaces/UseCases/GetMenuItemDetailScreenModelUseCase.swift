protocol GetMenuItemDetailScreenModelUseCase {
    func execute(with itemId: Int) async throws -> ScreenModelData
}
