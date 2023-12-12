import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MenuListViewModel(service: Webservice())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
            }.navigationTitle("Promotions Menu")
                .id(UUID())
                .listStyle(.plain)
                .task {
                await viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
