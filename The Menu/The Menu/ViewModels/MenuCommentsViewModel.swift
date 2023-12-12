import Foundation

@MainActor
class MenuCommentsViewModel: ObservableObject {
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        do {
            let screenModel = try await service.load(Constants.Urls.menuComments)
            components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
