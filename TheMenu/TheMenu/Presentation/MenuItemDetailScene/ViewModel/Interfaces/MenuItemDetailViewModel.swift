import Foundation
import SwiftUI

protocol MenuItemDetailViewModelDisplayLogic {
    func displayData(itemId: Int) async
}

protocol MenuItemDetailViewModelInputLogic {
    func prepareData(itemId: Int) async throws
}

@MainActor
protocol MenuItemDetailViewModelOutputLogic {
    var components: [UIComponent] { get }
}

protocol MenuItemDetailViewModel: MenuItemDetailViewModelOutputLogic, MenuItemDetailViewModelInputLogic, ObservableObject {}
