import SwiftUI

struct MenuItemDetailScreen: View {
    
    let itemId: Int
    
    @StateObject private var viewModel = MenuItemDetailViewModel(service: Webservice())
    
    init(itemId: Int) {
        self.itemId = itemId
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
        }.task {
            await viewModel.load(itemId: itemId)
        }
    }
}

struct MenuItemDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailScreen(itemId: 2)
    }
}
