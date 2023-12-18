import SwiftUI

struct MenuListViewFactory {
    @MainActor static func make() -> some View {
        let repository = ScreenModelRepositoryImpl()
        let useCase = GetMenuListScreenModelUseCaseImpl(repository: repository)
        let viewModel = MenuListViewModelImpl(useCase: useCase)
        let view = MenuListView(viewModel: viewModel)
        return view
    }
}
