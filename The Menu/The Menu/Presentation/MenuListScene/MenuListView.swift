import SwiftUI

struct MenuListView<VM: MenuListViewModel>: View {
    @ObservedObject var viewModel: VM
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
            }.id(UUID())
            .navigationTitle("Promotions Menu")
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

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListViewFactory.make()
    }
}
