import SwiftUI

struct MenuCommentsView<VM: MenuCommentsViewModel>: View {
    @ObservedObject var viewModel: VM

    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
        }.navigationTitle(viewModel.pageTitle)
            .id(UUID())
            .listStyle(.plain)
            .task {
                await displayData()
            }.refreshable {
                await displayData()
            }
    }
}

extension MenuCommentsView: MenuCommentsViewModelDisplayLogic {
    func displayData() async {
        do {
            try await viewModel.prepareData()
        } catch {
            print(error)
        }
    }
}

