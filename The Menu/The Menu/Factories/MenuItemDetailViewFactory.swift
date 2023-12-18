import SwiftUI

struct MenuItemDetailViewFactory {
    @MainActor static func make(itemId: Int) -> some View {
        let repository = ScreenModelRepositoryImpl()
        let useCase = GetMenuItemDetailScreenModelUseCaseImpl(repository: repository)
        let viewModel = MenuItemDetailViewModelImpl(useCase: useCase)
        let view = MenuItemDetailView(viewModel: viewModel, itemId: itemId)
        return view
    }
}
