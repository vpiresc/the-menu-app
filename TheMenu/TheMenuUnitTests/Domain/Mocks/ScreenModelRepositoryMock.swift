import Foundation
@testable import TheMenu

enum ResponseType {
    case success
    case failure
}

enum ResponseErrorMock: Error {
    case failedFetching
}

final class ScreenModelRepositoryMock: ScreenModelRepository {
    
    var jsonResponse: String
    var responseType: ResponseType
    var error: Error = ResponseErrorMock.failedFetching
    
    init(jsonResponse: String = "", responseType: ResponseType = .success) {
        self.jsonResponse = jsonResponse
        self.responseType = responseType
    }
  
    func fetchScreenModel(_ resource: String) async throws -> ScreenModelResponse {
        switch responseType {
        case .success:
            guard let data = jsonResponse.data(using: .utf8) else {
                throw error
            }
            do {
                let screenModel = try JSONDecoder().decode(ScreenModelResponse.self, from: data)
                return screenModel
            } catch {
                throw error
            }
        case .failure:
            throw error
        }
    }
}
