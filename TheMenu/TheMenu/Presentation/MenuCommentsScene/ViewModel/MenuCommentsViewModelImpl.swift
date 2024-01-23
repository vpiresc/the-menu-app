import Foundation
import SwiftUI

@MainActor
class MenuCommentsViewModelImpl: MenuCommentsViewModel {
    @Published var pageTitle: String = ""
    @Published var components: [UIComponent] = []
    
    private let useCase: GetMenuCommentsScreenModelUseCase
    
    init(useCase: GetMenuCommentsScreenModelUseCase) {
        self.useCase = useCase
    }
}

extension MenuCommentsViewModelImpl {
    func prepareData() async throws {
        do {
            let screenModelData = try await useCase.execute()
            pageTitle = screenModelData.pageTitle
            components = try screenModelData.buildComponents()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
