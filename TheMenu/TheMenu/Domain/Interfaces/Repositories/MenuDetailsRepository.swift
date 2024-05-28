protocol MenuDetailsRepository {
    func fetchMenuDetails(itemId: Int) async throws -> ScreenModelResponse
}
