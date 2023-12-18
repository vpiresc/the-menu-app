protocol GetMenuListScreenModelUseCase {
    func execute() async throws -> [UIComponent]
}
