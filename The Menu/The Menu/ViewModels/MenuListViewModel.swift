//
//  MenuListViewModel.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation

@MainActor
class MenuListViewModel: ObservableObject {
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        do {
            let screenModel = try await service.load(Constants.Urls.menuList)
            components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
