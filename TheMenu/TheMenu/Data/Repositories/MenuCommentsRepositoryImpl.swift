import Foundation

final class MenuCommentsRepositoryImpl {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension MenuCommentsRepositoryImpl: MenuCommentsRepository {
    func fetchMenuComments() async throws -> ScreenModelResponse {
        guard let url = URL(string: Constants.Urls.menuComments) else {
            throw NetworkError.invalidUrl
        }
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let screenModelResponse = try JSONDecoder().decode(ScreenModelResponse.self, from: data)
        
        return screenModelResponse
    }
}
