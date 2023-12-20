import Foundation
import SwiftUI

@MainActor
class MenuItemDetailViewModelImpl: MenuItemDetailViewModel {
    @Published var components: [UIComponent] = []
    
    private let useCase: GetMenuItemDetailScreenModelUseCase
    init(useCase: GetMenuItemDetailScreenModelUseCase) {
        self.useCase = useCase
    }
}

extension MenuItemDetailViewModelImpl {
    func prepareData(itemId: Int) async throws {
        do {
            let screenModelData = try await useCase.execute(with: itemId)
            components = try screenModelData.buildComponents()
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
