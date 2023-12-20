import SwiftUI

struct MenuListView<VM: MenuListViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
            }.id(UUID())
                .navigationTitle(viewModel.pageTitle)
            .listStyle(.plain)
            .task {
                await displayData()
            }
        }
    }
}

extension MenuListView: MenuListViewModelDisplayLogic {
    func displayData() async {
        do {
            try await viewModel.prepareData()
        } catch {
            print(error)
        }
    }
}
