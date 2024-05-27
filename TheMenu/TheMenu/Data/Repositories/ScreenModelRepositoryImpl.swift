import Foundation

final class ScreenModelRepositoryImpl {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension ScreenModelRepositoryImpl: ScreenModelRepository {
    func fetchScreenModel() async throws -> ScreenModelResponse {
        guard let url = URL(string: Constants.Urls.menuList) else {
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
extension ScreenModelRepositoryImpl: MenuDetailsRepository {
    func fetchMenuDetails(itemId: Int) async throws -> ScreenModelResponse {
        guard let url = URL(string: Constants.Urls.menuItemDetail(itemId: itemId)) else {
            throw NetworkError.invalidUrl
        }
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let screenModelResponse = try JSONDecoder().decode(ScreenModelResponse.self, from: data)
        
        return screenModelResponse
    }}

extension ScreenModelRepositoryImpl: MenuCommentsRepository {
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
