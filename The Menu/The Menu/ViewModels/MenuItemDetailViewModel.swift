import Foundation

@MainActor
class MenuItemDetailViewModel: ObservableObject {
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load(itemId: Int) async {
        do {
            let screenModel = try await service.load(Constants.Urls.menuItemDetail(itemId: itemId))
            self.components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
