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
            components = try await useCase.execute(with: itemId)
        } catch {
            throw(ComponentError.unableToLoad)
        }
    }
}
