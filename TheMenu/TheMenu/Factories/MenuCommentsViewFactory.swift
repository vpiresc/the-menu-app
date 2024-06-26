import SwiftUI

struct MenuCommentsViewFactory {
    @MainActor static func make() -> some View {
        let repository = MenuCommentsRepositoryImpl()
        let useCase = GetMenuCommentsScreenModelUseCaseImpl(repository: repository)
        let viewModel = MenuCommentsViewModelImpl(useCase: useCase)
        let view = MenuCommentsView(viewModel: viewModel)
        return view
    }
}
