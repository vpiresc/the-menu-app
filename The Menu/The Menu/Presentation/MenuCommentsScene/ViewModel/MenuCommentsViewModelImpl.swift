import Foundation
import SwiftUI

@MainActor
class MenuCommentsViewModelImpl: MenuCommentsViewModel {    
    @Published var components: [UIComponent] = []
    
    private let useCase: GetMenuCommentsScreenModelUseCase
    
    init(useCase: GetMenuCommentsScreenModelUseCase) {
        self.useCase = useCase
    }
}

extension MenuCommentsViewModelImpl {
    func prepareData() async throws {
        do {
            components = try await useCase.execute()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
