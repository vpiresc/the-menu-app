import SwiftUI

struct MenuListView<VM: MenuListViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
        }.accentColor(.gray)
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
