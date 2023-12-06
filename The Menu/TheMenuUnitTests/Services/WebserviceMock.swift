import Foundation
@testable import The_Menu

enum ResponseType {
    case success
    case failure
}

enum WebserviceErrorMock: Error {
    case genericError
    case unableToLoadData
    case unableToDecodeData
    case responseFailure
}

final class WebserviceMock: NetworkService {
    var jsonResponse: String
    var responseType: ResponseType
    var error: Error = WebserviceErrorMock.genericError
    
    init(jsonResponse: String = "", responseType: ResponseType = .success) {
        self.jsonResponse = jsonResponse
        self.responseType = responseType
    }
    
    func load(_ resourceName: String) async throws -> The_Menu.ScreenModel {
        
        switch responseType {
        case .success:
            guard let data = jsonResponse.data(using: .utf8) else {
                error = WebserviceErrorMock.unableToLoadData
                throw error
            }
            do {
                let screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
                return screenModel
            } catch {
                self.error = WebserviceErrorMock.unableToDecodeData
                throw error
            }
        case .failure:
            error = WebserviceErrorMock.responseFailure
            throw error
        }
    }
}
