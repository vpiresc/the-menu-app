protocol ScreenModelRepository {
    func fetchScreenModel() async throws -> ScreenModelResponse
}

protocol MenuDetailsRepository {
    func fetchMenuDetails(itemId: Int) async throws -> ScreenModelResponse
}

protocol MenuCommentsRepository {
    func fetchMenuComments() async throws -> ScreenModelResponse
}
