import Foundation

final class ScreenModelRepositoryImpl {}

extension ScreenModelRepositoryImpl: ScreenModelRepository {
    func fetchScreenModel(_ resource: String) async throws -> ScreenModelResponse {
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
             throw NetworkError.invalidServerResponse
        }
        
        let screenModelResponse = try JSONDecoder().decode(ScreenModelResponse.self, from: data)
        
        return screenModelResponse
    }
}
