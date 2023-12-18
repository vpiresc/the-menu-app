import SwiftUI

struct MenuCommentsView<VM: MenuCommentsViewModel>: View {
    @ObservedObject var viewModel: VM

    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
        }.navigationTitle("Menu Comments")
            .id(UUID())
            .listStyle(.plain)
            .task {
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

struct MenuCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCommentsViewFactory.make()
    }
}
