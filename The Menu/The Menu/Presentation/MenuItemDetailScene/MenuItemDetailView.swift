import SwiftUI

struct MenuItemDetailView<VM: MenuItemDetailViewModel>: View {
    @ObservedObject var viewModel: VM
    let itemId: Int

    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
        }.task {
            await displayData(itemId: itemId)
        }
    }
}

extension MenuItemDetailView: MenuItemDetailViewModelDisplayLogic {
    func displayData(itemId: Int) async {
        do {
            try await viewModel.prepareData(itemId: itemId)
        } catch {
            print(error)
        }
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailViewFactory.make(itemId: 1)
    }
}
