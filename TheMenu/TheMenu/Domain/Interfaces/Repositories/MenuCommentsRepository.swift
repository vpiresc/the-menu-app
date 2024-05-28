protocol MenuCommentsRepository {
    func fetchMenuComments() async throws -> ScreenModelResponse
}
