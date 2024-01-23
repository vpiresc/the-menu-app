protocol ScreenModelRepository {
    func fetchScreenModel(_ resource: String) async throws -> ScreenModelResponse
}
