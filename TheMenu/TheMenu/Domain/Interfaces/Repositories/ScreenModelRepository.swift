protocol ScreenModelRepository {
    func fetchScreenModel() async throws -> ScreenModelResponse
}
